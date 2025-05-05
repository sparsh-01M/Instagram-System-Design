CREATE DATABASE post_db;
USE post_db;

-- USER PROFILE TABLE
CREATE TABLE profile (
  user_id INT PRIMARY KEY,
  username VARCHAR(50) UNIQUE,
  bio TEXT,
  profile_pic_url VARCHAR(200),
  join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- POSTS TABLE
CREATE TABLE post (
  post_id VARCHAR(10) PRIMARY KEY,
  user_id INT,
  text VARCHAR(100),
  img_url VARCHAR(200),
  time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES profile(user_id)
);

-- FOLLOW/UNFOLLOW TABLE
CREATE TABLE follow_unfollow (
  follower_id INT,
  following_id INT,
  active BOOLEAN DEFAULT TRUE,
  time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (follower_id, following_id),
  FOREIGN KEY (follower_id) REFERENCES profile(user_id),
  FOREIGN KEY (following_id) REFERENCES profile(user_id)
);

-- ACTIVITY TABLE (For Linking Likes/Comments)
CREATE TABLE activity (
  activity_id INT PRIMARY KEY AUTO_INCREMENT,
  post_id VARCHAR(10),
  FOREIGN KEY (post_id) REFERENCES post(post_id)
);

-- LIKES TABLE
CREATE TABLE likes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  activity_id INT,
  time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES profile(user_id),
  FOREIGN KEY (activity_id) REFERENCES activity(activity_id)
);

-- COMMENTS TABLE
CREATE TABLE comment (
  comment_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  activity_id INT,
  text VARCHAR(1000),
  time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES profile(user_id),
  FOREIGN KEY (activity_id) REFERENCES activity(activity_id)
);

-- CHAT TABLE
CREATE TABLE chat (
  chat_id INT PRIMARY KEY AUTO_INCREMENT,
  sender_id INT,
  receiver_id INT,
  message TEXT,
  time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES profile(user_id),
  FOREIGN KEY (receiver_id) REFERENCES profile(user_id)
);

-- CALL TABLE (For voice/video calls)
CREATE TABLE call_log (
  call_id INT PRIMARY KEY AUTO_INCREMENT,
  caller_id INT,
  receiver_id INT,
  call_type ENUM('voice', 'video'),
  call_start TIMESTAMP,
  call_end TIMESTAMP,
  FOREIGN KEY (caller_id) REFERENCES profile(user_id),
  FOREIGN KEY (receiver_id) REFERENCES profile(user_id)
);

INSERT INTO profile (user_id, username, bio, profile_pic_url) VALUES
  (1, 'user1', 'Love nature', 'pic1.jpg'),
  (2, 'user2', 'Fitness freak', 'pic2.jpg'),
  (3, 'user3', 'Traveller', 'pic3.jpg'),
  (4, 'user4', 'Photographer', 'pic4.jpg');

INSERT INTO post (post_id, user_id, text, img_url) VALUES
  ('p0001', 1, 'Nature', 'url1'),
  ('p0002', 2, 'Gym', 'url2'),
  ('p0003', 3, 'Mountain', 'url3'),
  ('p0004', 4, 'Love', 'url4');
