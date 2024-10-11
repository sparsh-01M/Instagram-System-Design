CREATE DATABASE post_db;

USE post_db;

CREATE TABLE post(
  user_id INT,
  post_id INT PRIMARY KEY,
  test VARCHAR(100),
  img_url VARCHAR(100),
  time_stamp TIMESTAMP
  );

CREATE TABLE likes(
  type_comment_post VARCHAR(50),
  active TRUE,
  activity_id INT,
  user_id INT,
  time_stamp TIMESTAMP,
  id INT
  );

CREATE TABLE comment(
  comment_id INT,
  test VARCHAR(1000),
  time_stamp TIMESTAMP,
  activity_id INT
  );

CREATE TABLE activity(
  activity_id INT,
  likes INT
  );

CREATE TABLE follow_unfollow(
  active TRUE,
  follower_id INT, 
  following_id INT,
  time_stamp TIMESTAMP
);

INSERT INTO post VALUES
  (00001, 'p0001', 'nature', 'url1', 22.09),
  (00002, 'p0002', 'gym', 'url2', 22.19),
  (00003, 'p0003', 'mountain', 'url3', 23.54),
  (00004, 'p0004', 'love', 'url4', 15.43);
