INSERT INTO tags
VALUES ('sciences'), ('arts');
DELETE FROM tags
WHERE name = 'being cool' OR name = 'parties';

DELETE FROM article_tags
WHERE tag__name = 'parties' OR tag__name = 'being cool';
INSERT INTO article_tags
VALUES (3, 'sciences'), (4, 'arts');

UPDATE articles
SET body = 'Here are the reasons why this article is so interesting. Developping these reasons might be tricky when the aim of the article is just to show that it has content.', slug = 'an-article-about-sharing-ideas', title = 'An article about sharing ideas', description = 'sharing ideas'
WHERE id = 3;
UPDATE articles
SET body = 'This information might be useful for this reason. I also wnat to share an argument that shows how you can make life easier for you and others.', slug = 'how-to-make-life-easier', title = 'How to make life easier', description = 'easier life'
WHERE id = 4;

UPDATE comments
SET body = 'Thanks for sharing these ideas !'
WHERE id =4;
UPDATE comments
SET body = 'Oh, now I know how to do it. Thanks, Can you develop a bit more about that ?', author__id = 7
WHERE id =5;

UPDATE users
SET email = 'john@mlp', username = 'John', bio = 'I am a kind person. I am interested about improving well-being', image = '/static/avatars/john.png'
WHERE username = 'PinkiePie';
UPDATE users
SET email = 'tom@mlp', username = 'Tom', bio = 'I would like to share ideas', image = '/static/avatars/tom.png'
WHERE username = 'Fluttershy';
UPDATE users
SET email = 'mary@mlp', username = 'Mary', bio = 'Hey ! I am Mary :)', image = '/static/avatars/mary.png'
WHERE username = 'Dashy';

