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
