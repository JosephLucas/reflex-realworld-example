{-# LANGUAGE FlexibleContexts, LambdaCase, MultiParamTypeClasses, OverloadedStrings, PatternSynonyms #-}
{-# LANGUAGE ScopedTypeVariables                                                                     #-}
module Frontend.Editor where

import Control.Lens
import Reflex.Dom.Core

import           Control.Monad.IO.Class (MonadIO)
import qualified Data.Map               as Map
import qualified Data.Set               as Set
import           Obelisk.Route.Frontend (pattern (:/), R, SetRoute, setRoute)
import           Servant.Common.Req     (reqSuccess)

import qualified Common.Conduit.Api.Articles.Article    as Article
import           Common.Conduit.Api.Articles.Attributes (ArticleAttributes (..), CreateArticle)
import           Common.Conduit.Api.Namespace           (Namespace (Namespace), unNamespace)
import qualified Common.Conduit.Api.User.Account        as Account
import           Common.Route                           (DocumentSlug (..), FrontendRoute (..))
import           Frontend.Conduit.Client                (apiArticles, articlesCreate, getClient)
import           Frontend.FrontendStateT
import           Frontend.Utils                         (buttonClass)

editor
  :: forall t m js s
  . ( DomBuilder t m
     , PostBuild t m
     , Prerender js t m
     , SetRoute t (R FrontendRoute) m
     , SetRoute t (R FrontendRoute) (Client m)
     , HasFrontendState t s m
     , HasLoggedInAccount s
     , TriggerEvent t m
     , PerformEvent t m
     , MonadIO (Performable m)
     )
  => m ()
editor = userWidget $ \acct -> elClass "div" "editor-page" $ do
  elClass "div" "container" $
    elClass "div" "row" $
      elClass "div" "col-xs-12 col-md-10 offset-md-1" $ do
        prerender_ blank $ el "form" $
          el "fieldset" $ do
            titleI <- elClass "fieldset" "form-group" $
              textInput $ def
                & textInputConfig_attributes .~ (constDyn (Map.fromList
                  [("class","form-control")
                  ,("placeholder","Article Title")
                  ]))
            descI <- elClass "fieldset" "form-group" $
              textInput $ def
                & textInputConfig_attributes .~ (constDyn (Map.fromList
                  [("class","form-control")
                  ,("placeholder","What's this article about?")
                  ]))
            bodyI <- elClass "fieldset" "form-group" $
              textArea $ def
                & textAreaConfig_attributes .~ (constDyn (Map.fromList
                  [("class","form-control")
                  ,("placeholder","Write your article (in markdown)")
                  ,("rows","8")
                  ]))
            publishE <- buttonClass "btn btn-lg btn-primary pull-xs-right" $ text "Publish Article"
            let createArticle :: Dynamic t CreateArticle = ArticleAttributes
                  <$> titleI ^. textInput_value
                  <*> descI  ^. textInput_value
                  <*> bodyI  ^. textArea_value
                  <*> constDyn Set.empty
            resE <- getClient ^. apiArticles . articlesCreate . to (\f -> f
              (constDyn . Identity . Just $ Account.token acct)
              (pure . pure . Namespace <$> createArticle)
              publishE
              )
            let successE = fmapMaybe (reqSuccess . runIdentity) resE
            setRoute $
              (\a -> FrontendRoute_Article :/ (DocumentSlug (Article.slug a)))
              . unNamespace
              <$> successE
            pure ()
  pure ()
