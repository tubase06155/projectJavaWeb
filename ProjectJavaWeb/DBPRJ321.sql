USE [master]
GO
/****** Object:  Database [FunEnglish]    Script Date: 11/12/2018 9:30:07 AM ******/
CREATE DATABASE [FunEnglish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FunEnglish', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017ANHTU\MSSQL\DATA\FunEnglish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FunEnglish_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017ANHTU\MSSQL\DATA\FunEnglish_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FunEnglish] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FunEnglish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FunEnglish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FunEnglish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FunEnglish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FunEnglish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FunEnglish] SET ARITHABORT OFF 
GO
ALTER DATABASE [FunEnglish] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FunEnglish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FunEnglish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FunEnglish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FunEnglish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FunEnglish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FunEnglish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FunEnglish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FunEnglish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FunEnglish] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FunEnglish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FunEnglish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FunEnglish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FunEnglish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FunEnglish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FunEnglish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FunEnglish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FunEnglish] SET RECOVERY FULL 
GO
ALTER DATABASE [FunEnglish] SET  MULTI_USER 
GO
ALTER DATABASE [FunEnglish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FunEnglish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FunEnglish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FunEnglish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FunEnglish] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FunEnglish', N'ON'
GO
ALTER DATABASE [FunEnglish] SET QUERY_STORE = OFF
GO
USE [FunEnglish]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 11/12/2018 9:30:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[lessonID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[imagePath] [nvarchar](300) NULL,
	[category] [int] NOT NULL,
	[content] [text] NOT NULL,
	[difficulty] [int] NOT NULL,
	[audioPath] [nchar](300) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[lessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonCategory]    Script Date: 11/12/2018 9:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonCategory](
	[cateID] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LessonCategory] PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 11/12/2018 9:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionID] [int] IDENTITY(1,1) NOT NULL,
	[lessonID] [int] NOT NULL,
	[questionContent] [nvarchar](max) NOT NULL,
	[opt1] [nvarchar](100) NOT NULL,
	[opt2] [nvarchar](100) NOT NULL,
	[opt3] [nvarchar](100) NOT NULL,
	[opt4] [nvarchar](100) NOT NULL,
	[rightOption] [int] NOT NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Question_Answer]    Script Date: 11/12/2018 9:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Question_Answer](
	[userID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
	[answerOption] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Response]    Script Date: 11/12/2018 9:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Response](
	[responseID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[username] [nvarchar](100) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[content] [text] NOT NULL,
	[isActive] [bit] NULL,
	[email] [nvarchar](100) NULL,
	[content2] [nvarchar](max) NULL,
 CONSTRAINT [PK_User_Response] PRIMARY KEY CLUSTERED 
(
	[responseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTBL]    Script Date: 11/12/2018 9:30:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTBL](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[userType] [int] NOT NULL,
	[score] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (24, N'Tomatoes', N'lesson1.jpg', 3, N'The tomato is from South America. When the tomato came to Europe, people did not eat it. Doctors said it would make them sick. So people just grew tomatoes because they looked nice.
Now people from all over the world eat tomatoes. Tomatoes are used in sauce, soup, juice, salsa, and ketchup. The tomato is very good for you. Only a tomato leaf or stem will make you sick.
People do odd things with tomatoes. People grow tomatoes in space. There is a big tomato fight every year in Spain. A long time ago, people would toss a bad tomato when they saw a show they did not like.
In Canada, many tomatoes are grown on big farms. The farms bring in poor people from far away to help grow tomatoes. Without these workers, the farms could not run. But the workers do not get much money. Canada does not let the workers stay here. Many people say this is not fair.
Most farms pick tomatoes before they are ripe. They last longer this way. But these tomatoes do not taste as good. So lots of people grow their own tomatoes.
Grow Your Own Tomatoes
Tomatoes that you grow are better than tomatoes that you buy. You can grow tomatoes inside if you do not have a garden.
You need:
-	Tomato seeds
-	A big pot (50 cm deep)
-	Potting soil (many big food shops sell this)
-	A window
Fill the pot with potting soil. Pack the soil down a little bit. Put a seed on top of the soil. Add a bit more soil on top.
Add water. The soil must always be a bit wet. Seeds like to be warm. Put your pot in a warm place. It does not need sun yet.
The plant will grow above the soil. Put the plant by a window. The plant needs four hours of sun a day. You can tie the stem to a stick to help the plant stay up. Always keep the soil a bit wet.
Pick the tomatoes when they are the same red colour top to bottom. Enjoy!!
', 3, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (25, N'A Special Christmas Present', N'lesson2.jpeg', 1, N'a Christmas treeDavid wants to buy a Christmas present for a very special person, his mother. David''s father gives him $5.00 a week pocket money and David puts $2.00 a week into his bank account. After three months David takes $20.00 out of his bank account and goes to the shopping mall. He looks and looks for a perfect gift.
Suddenly he sees a beautiful brooch in the shape of his favourite pet. He says to himself, "My mother loves jewelry, and the brooch costs only $17.00." He buys the brooch and takes it home. He wraps the present in Christmas paper and places it under the tree. He is very excited and he is looking forward to Christmas morning to see the joy on his mother''s face.
a spiderBut when his mother opens the present she screams with fright because she sees a spider.
', 2, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (26, N'Head, Heart, Hand', N'thumbnail1.jpg', 2, N'Todd: So, I''m here with Olga who is a health coach and I thought we would talk about learning, so people have to learn all these new things to be healthy. It might be a big change in their life. What type of advice would you give people for completely adapting to new change and learning new things?
Olga: Well, I discovered that the most important things that people can do to be healthy and happy is to educate themselves. So what I do, I call VITA Academy, the Academy of Life, and there are four H''s that the cornerstone of this learning concept.
Todd: Okay. Oh, that''s great, so what are the four H''s?
Olga: The first H is head, so first you upload a lot of information that is maybe logical, brainy, and you get knowledge, you kind of understand things.
Todd: Okay, right. So you ... Basically you take in the information and ... Okay, then the next step?
Olga: The next step is to check with yourself if the message that arrived into your head resonates. Do you feel it in your heart?
Todd: Wow, that''s pretty good. So also you could probably use your heart to see if it''s true, right? Like intuition. Is it something that''s believable? If it''s something that''s true?
Olga: Exactly. You know, you can call it gut feeling, intuition, talking to angels. I teach bioresonance, based on that it''s how to raise your intuition to pretty much the brain level and understand yourself, but it''s not ... Gut feeling is not an H, so I just stick with heart.
Todd: I like that. Okay, so then after the heart you said it''s hand?
Olga: Yes. The third level of learning is experiencing it, so using your hands and bringing all this knowledge into your life and seeing how it works.
Todd: Alright, so basically like put something into practice, right? Use it or lose it. If you don''t do it, then you''re not going to really know it.
Olga: Exactly. Lose it and use it work on all levels. Is there muscles if you don''t lose goes into atrophy, same goes for your memory or anything else in your life.
Todd: Oh wow, that''s great. Okay, so then the last one is help?
Olga: Yes, so once you understand what to do, you feel that it''s the right thing to do, you experience and you saw the positive results, then it''s only natural to share your success story and help other people. For me, the best way to learn is by teaching, by helping.
Todd: Oh wow, that''s really nice. So recap, so it''s head, you take in the information; heart, you know if it''s true or not, like does it resonate with you?; hand, you put it into practice; and then help, you actually give.
Olga: Yes, exactly.
Todd: Wow, that''s some really good advice. Thanks a lot.
Olga: Most welcome.
', 1, N'lesson1.mp3                                                                                                                                                                                                                                                                                                 ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (27, N'World Traveller', N'thumbnail_2.jpg', 2, N'Todd: Tennessee?
Tenn: Yes.
Todd: We''re gonna talk about sports.
Tenn: OK. I''m not big on sports but..
Todd: OK. Well, that''s OK. So you don''t like sports?
Tenn: Well, I like sports but I''m just not an avid sports watcher. You know I would usually rather watch a movie or some kind of history program.
Todd: Oh, OK. So you''re into history.
Tenn: Oh, yes!
Todd: OK. What kind of history?
Tenn: That''s a kind of a difficult question. I would say I''m interested-- primarily, I''m interested in ancient and medieval but I also like studying the history of the countries that I visit it makes it more interesting when I go sight-seeing.
Todd: OK. What countries have you visited?
Tenn: I''ve been to 26 countries.
Todd: Really?
Tenn: Yeah.
Todd: Oh, OK. Yeah, you can''t name them all.
Tenn: The big ones I would say, I''ve been over a good bit of Europe, Mexico, Peru.. I spent almost a year in Egypt and I went to Isreal, Jordan and now I''m here in Japan. I''ve been here in Japan a year and a half. And while I have been here, I visited Korea for about a week.
Todd: OK. Wow! That''s a lot so did you do the Pyramids in Egypt?
Tenn: Oh, yes. Actually, I climbed the pyramids.
Todd: Oh, really? Nice. What''s it like on the top?
Tenn: Very, very interesting. You can see-- it was during the summer so the visibility was rather low.
Todd: Oh, OK.
Tenn: But, to see we were on The Great Pyramid and the second Pyramid Kefron was right nearby and it is a very different perspective to see it from. Very interesting to be eye-level, to be on the same level as the top of that second pyramid.
Todd: OK. Wow! So you were in Peru, right?
Tenn: Yes.
Todd: OK. What''s the big thing people see in Peru?
Tenn: Machu Pichu.
Todd: Machu Pichu. OK. What is Machu Pichu?
Tenn: Machu Pichu is the ruins of a city that was built by the Inca People.
Todd: OK.
Tenn: Maybe over six hundred years ago and was lost, no one knew what happened to it until it was recently discovered about a hundred years ago.
Todd: OK. Wow. Nice. All right, thanks a lot David.
Tenn: Sure!
Todd: Or Tennessee.
', 2, N'lesson2.mp3                                                                                                                                                                                                                                                                                                 ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (28, N'Nature', N'thumbnail3.jpg', 2, N'Todd: OK. Hello, Kevin?
Kevin: Hi, Todd. How are you?
Todd: Doing pretty good.
Kevin: Good.
Todd: Kevin we''re gonna talk about nature.
Kevin: OK.
Todd: First of all could you tell the listener where we are?
Kevin: Well, let''s see. We are on, kind of on the side of a hill in the forest but we have a spectacular view of Mount Fuji on the other side of the valley.
Todd: Yeah. It''s really nice here. Why are you in this forest right now?
Kevin: Well, I''m currently working and I''m teaching an intensive English course up here at the campus.. up here in the forest.
Todd: Oh, nice. Do you take any walks in the woods?
Kevin: Yes, I enjoy taking walks in the woods. And sometimes I even go for a jog in the woods, there''s a few trails around here and there''s a nice golf course as well that you can run around.
Todd: OK, great! What''s the best thing about being in nature? In the forest?
Kevin: Well, for me it''s the stress relief that it provides especially living in Tokyo which is of course one of the world''s largest and most chaotic cities. It''s also nice to get back out into nature sometimes and just hear the insects which obviously we can hear very clearly right now, as well as some birds and you know it''s just nice to get back out into nature.
Todd: I agree. OK. Thanks a lot Kevin.
Kevin: You''re welcome.
', 1, N'lesson3.mp3                                                                                                                                                                                                                                                                                                 ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (29, N'Childhood memories', N'thumbnail4.jpg', 2, N'Vella: So Daniel, let''s talk about childhood memories. Do you have any fond memory?
Daniel: Well, yeah, I do. I had a great time when I was a kid but definitely my best memory is, well, holidays. When I was a kid in Chile, we used to have a three month summer holiday and it was brilliant because I used to go to the countryside to my great-grandma''s house and she had kind of a hostel at that time and it was brilliant because you had people coming in and out all the time, new people. The town was like really, really small and everything was so natural so I got to spend three months every summer in a really nice place doing nothing but playing with my friends all the time, going to the beach every day and like having amazing food. It was too good to be true, seriously. Unfortunately like then I grew older and I couldn''t have the three months so I was going like, I don''t know, two weeks and stuff like that. And then lately I couldn''t go any more so it''s shame but at the same time it''s a great, it''s really good that I got the chance to do it and I got the chance to experience it and I think that''s one of my great memories of my childhood.

Vella: So you go there every summer?

Daniel: Well, not any more but I used to go there when I was a kid every, pretty much every summer, yeah.

Vella: So how did you spend the time? Like what did you do? Did you just play with friends or...?

Daniel: Well, yeah, I used to get up really late every day then I don''t know go for a football game with friends then, I don''t know, having an amazing lunch. In the afternoon going to the beach, coming back, have dinner and then go out and play again. It was really like the same thing every day but at the same time since I was playing every day it didn''t feel like a routine so, I don''t know, three months doing that every year was amazing.

Vella: I mean food and friends, my definition of having fun.

Daniel: Yeah, yeah, it is definitely, yeah.

Vella: So you had three months holiday?

Daniel: Yeah.

Vella: Summer holiday? That''s pretty long.

Daniel: Yeah, it''s because, well we finish everything in December before Christmas and New Year so you have pretty much the whole of December plus January and February. That''s the summer in Chile.

Vella: Interesting, summer in December.

Daniel: Well, yeah, it is actually.
', 3, N'lesson4.mp3                                                                                                                                                                                                                                                                                                 ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (30, N'On the Road', N'thumbnail5.jpg', 2, N'Vella: OK, Daniel, I know you''re still really young but I know you must be thinking about what you''re going to do in the future so my question would be what do you want to achieve in your life?
Daniel: Well, there are definitely three things I want to do. For example, I want to do before I die, at least three things. The first one is I want to visit every continent in the earth. I''m still young but I want to do it in the next couple of years. I''ve never been to Africa, for example, that''s a continent, that''s a part of the world I''m very interested in.

The second one is that I want to see things from a different perspective. For example, I want to climb a really, really high mountain. I don''t know, Everest would be amazing but I know like you need the special training and stuff like that. Or do paragliding, I would love to have the feeling that I''m flying. That''s something that really, really calls my attention to see, you know, to see something from a different perspective. It can give you not only the experience but also it can help you think in a very different way for, I don''t know, many things in the future.
', 1, N'lesson5.mp3                                                                                                                                                                                                                                                                                                 ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1031, N'abc', N'1.jpg', 3, N'ababx', 2, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 0)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1032, N'PRESENT TENSE', N'1.jpg', 1, N'Level: intermediate

There are two tenses in English: past and present.

The present tense is used to talk about the present and to talk about the future.

There are four present tense forms:

Present simple	I work
Present continuous	I am working
Present perfect	I have worked
Present perfect continuous	I have been working
We can use all these forms:

to talk about the present:;
London is the capital of Britain.
He works at McDonaldâ??s.
He is working at McDonaldâ??s.
He has worked there for three months now.
He has been working there for three months now.

to talk about the future:
The next train leaves at this evening at 1700 hours.
Iâ??ll phone you when I get home.
He is meeting Peter in town this afternoon.
Iâ??ll come home as soon as I have finished work.
You will be tired out after you have been working all night.', 3, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 0)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1033, N'PRESENT TENSE', N'23659228_2074495316111934_2642556003480165860_n.jpg', 1, N'Bui Anh Tu ', 2, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 0)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1034, N'dfhdfh', N'27540314_2112980185596780_7688668776507108851_n.jpg', 1, N'fghfghfgh', 4, N'15042257_1827380210871573_7967649707840438188_o.jpg                                                                                                                                                                                                                                                         ', 0)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1035, N'PRESENT TENSE', N'5chuvesau.jpg', 1, N'hjhjlhjlhjlhjl', 1, N'15042257_1827380210871573_7967649707840438188_o.jpg                                                                                                                                                                                                                                                         ', 0)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1036, N'jklj', N'5chuvesau.jpg', 1, N'jkjkjkjj', 3, N'10458129_307543209413636_8874673479235519154_n.jpg                                                                                                                                                                                                                                                          ', 0)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1037, N'PRESENT TENSE', N'28514709_2030247980520920_635187637815303046_o.jpg', 3, N'SIMPLE PRESENT TENSE
The simple present tense is one of several forms of present tense in English. It is used to describe habits, unchanging situations, general truths, and fixed arrangements. The simple present tense is simple to form. Just use the base form of the verb: (I take, you take, we take, they take) The 3rd person singular takes an -s at the end. (he takes, she takes)

THE SIMPLE PRESENT TENSE IS USED:
To express habits, general truths, repeated actions or unchanging situations, emotions and wishes:
I smoke (habit); I work in London (unchanging situation); London is a large city (general truth)
To give instructions or directions:
You walk for two hundred meters, then you turn left.
To express fixed arrangements, present or future:
Your exam starts at 09.00
To express future time, after some conjunctions: after, when, before, as soon as, until:
He''ll give it to you when you come next Saturday.
Be careful! The simple present is not used to express actio', 3, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 0)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1038, N'Past simple', N'táº£i xuá»‘ng (1).jpg', 3, N'Forms
With most verbs the past tense is formed by adding -ed:

call >> called; like >> liked; want >> wanted; work >> worked

But there are a lot of irregular past tenses in English. Here are the most common irregular verbs in English, with their past tenses:
Use
We use the past tense to talk about:

something that happened once in the past:
I met my wife in 1983.
We went to Spain for our holidays.
They got home very late last night.

something that happened again and again in the past:
When I was a boy I walked a mile to school every day.
We swam a lot while we were on holiday.
They always enjoyed visiting their friends.

something that was true for some time in the past:
I lived abroad for ten years.
He enjoyed being a student.
She played a lot of tennis when she was younger.

we often use phrases with ago with the past tense:
I met my wife a long time ago.

Questions and negatives
We use did to make questions with the past tense:

When did you meet your wife?
Where did you go for your holidays?
Did she play tennis when she was younger?
Did you live abroad?

But look at these questions:

Who discovered penicillin?
Who wrote Don Quixote?

For more on these questions see our question forms page

We use didnâ??t (did not) to make negatives with the past tense:

They didnâ??t go to Spain this year.
We didnâ??t get home until very late last night.
I didnâ??t see you yesterday. 
', 2, N'13891936_1830408940520574_911185302045673098_n.jpg                                                                                                                                                                                                                                                          ', 0)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1039, N'Adjective Or Participle', N'táº£i xuá»‘ng (2).jpg', 3, N'Adjective Or Participle
DECEMBER 6, 2017 - pdf

Participles can also act as adjectives. In this case, they modify nouns. Sometimes participles are  used as adjectives after be or other copular verbs. In this case, they complete the predicate.

When participles help to form continuous and perfect tenses, they act as participles.

This grammar exercise tests your ability to recognize participles and adjectives.', 4, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 0)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1040, N'Val''s Garden', N'Vals-Garden1-by-Carlee-Ashton-Diabot.jpg', 1, N'I am new to the city. I do not know anyone. But an old woman lives next door. Her name is Val. She gives me a big box of vegetables.

She grows them in a garden by the sidewalk. There are carrots, tomatoes, beans, and peas. They are the best vegetables I ever ate. Val lives alone, too. But she seems happy in her garden. She loves plants. Sometimes, I can hear her talking to them. Maybe that is why they grow so big.

One day, I stop seeing Val in the garden. I see people take many boxes from her home. Weeds grow in her garden. The dirt is dry. The plants look sad. Val must have passed on.

So I pull the weeds. I water the garden. I even talk to the plants.

Then a family moves next door. They are new to the city. They do not know anyone. And I give them a big box of vegetables from Valâ??s garden.', 3, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1041, N'Adjectives and Adverbs', N'29570635_1081395675335084_322667253165341498_n.jpg', 3, N'Introduction
Adjectives such as beautiful, nice, and red describe nouns. Adverbs such as quickly, badly, or warmly describe verbs. This page will explain the differences between them, and show you how to make adverbs from adjectives.

1. Using adjectives and adverbs
Adjective	Adverb	Example
beautiful	 	Ann is beautiful.
 	beautifully	Ann sings beautifully.
warm	 	The room is warm.
 	warmly	Joe smiles warmly.
slow	 	The car is slow.
 	slowly	Ann drives slowly.
2. Making adverbs from adjectives
Adverbs are usually made from adjectives by adding -LY. These are the rules:

Adjective ending in...	How to make the adverb	Examples
y	Change Y to I and add -LY	heavy - heavily
happy - happily
lazy - lazily
[anything else]	Just add -LY	warm - warmly
nice - nicely
loud - loudly
There are some important exceptions:

Adjective	Adverb
good	well
late	late
(â??Latelyâ? means recently.
It is not the adverb
from â??lateâ?.)
early	early
fast	fast
hard	hard
(â??Hardlyâ? means not much.
It is not the adverb
from â??hardâ?.)
When you are sure that you understand the lesson, you can continue with the exercise.', 3, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 0)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1042, N'The Sack Garden', N'Meg5-by-Carlee-Ashton-Diabot.jpg', 1, N'This is Meg. Meg lives in South Africa. She has three kids. It is hard to feed her kids. White people own most of the farmland in South Africa. Meg does not have land for a garden. Food costs a lot of money.

But Meg has a very good way to grow food. She finds a big sack. She puts rocks in the middle of the sack. She fills the rest of the sack with dirt. She makes little holes in the side of the sack. She puts a tomato plant in one hole. She puts a bean plant in one hole. She puts a green pepper plant in one hole. She puts eggplant in the top of the sack. She waters the sack garden from the top.

Her garden does not need much water. Her garden does not need much room. Her garden does not cost much money to make. Her garden does not have many weeds.

Now Meg can feed her kids.', 3, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1043, N'GM Food', N'wheat-wp.png', 1, N'It is hard to be a farmer. Cold weather can kill your crops. Bugs can eat your crops. Weeds can hurt your crops. Your crops may need more rain than they get. Fruits and Vegetables can go bad before they are sold. Some people say farmers can fix all of this with GM food.

What is GM food? All living things have DNA. DNA tells living things how to grow. These days, people can change the DNA that tells food how to grow. When people change the DNA of food, it is called GM food.

Some GM food can grow in cold weather. GM food can stop bugs from eating it. GM fruits and vegetables can stay good longer. One day, GM food may be able to grow in dry land in Africa. It will feed people who do not have much food.

But there is a lot we do not know about GM food. Will GM companies help poor people grow food? Or do GM companies just want to get rich? Does GM food kill bugs we need, like butterflies? Does GM food make birds sick? Does GM food make people sick? We do not know. There have not been many tests on GM food.

Do you think farmers should grow GM food?', 4, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1044, N'Canada''s Tallest Tree', N'tree2-wp.png', 1, N'A man named Randy liked to hunt trees. He looked for big trees and old trees. He made maps to show where these trees were. He did not want to cut them down. He wanted people to take care of them.

Randy was told of a very tall tree on Vancouver Island. The tree was said to be 314 feet tall. That would make it the tallest tree in Canada. Randy set out to find the tree.

But someone else found it first. It was found by a logger. Loggers wanted to cut down Canadaâ??s tallest tree and all the trees around it.

Randy made a path in the forest so people could see the tall tree. The tree was so big and beautiful it would fill them with awe. More and more people wanted to save that forest. Thanks to these people, that forest is now a park. Canadaâ??s tallest tree is still there.

There may still be a bigger tree out there. Maybe you will find it. But there are only a few old forests left in Canada. Many are still at risk of being cut down.

', 1, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1045, N'Adjectives and Adverbs', N'táº£i xuá»‘ng (3).jpg', 3, N'Introduction
Adjectives such as beautiful, nice, and red describe nouns. Adverbs such as quickly, badly, or warmly describe verbs. This page will explain the differences between them, and show you how to make adverbs from adjectives.

1. Using adjectives and adverbs
Adjective	Adverb	Example
beautiful	 	Ann is beautiful.
 	beautifully	Ann sings beautifully.
warm	 	The room is warm.
 	warmly	Joe smiles warmly.
slow	 	The car is slow.
 	slowly	Ann drives slowly.
2. Making adverbs from adjectives
Adverbs are usually made from adjectives by adding -LY. These are the rules:

Adjective ending in...	How to make the adverb	Examples
y	Change Y to I and add -LY	heavy - heavily
happy - happily
lazy - lazily
[anything else]	Just add -LY	warm - warmly
nice - nicely
loud - loudly', 3, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 0)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1046, N'A Special Christmas Present', N'5chuvesau.jpg', 2, N'David wants to buy a Christmas present for a very special person, his mother. David''s father gives him $5.00 a week pocket money and David puts $2.00 a week into his bank account. After three months David takes $20.00 out of his bank account and goes to the shopping mall. He looks and looks for a perfect gift.

Suddenly he sees a beautiful brooch in the shape of his favourite pet. He says to himself, "My mother loves jewelry, and the brooch costs only $17.00." He buys the brooch and takes it home. He wraps the present in Christmas paper and places it under the tree. He is very excited and he is looking forward to Christmas morning to see the joy on his mother''s face.
a spiderBut when his mother opens the present she screams with fright because she sees a spider.', 3, N'a-special-christmas-present.ogg                                                                                                                                                                                                                                                                             ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1047, N'Adjectives', N'42552778_1038336832993710_3040240914560712704_n.jpg', 3, N'What are adjectives?
1. An adjective is a word which modifies a noun or a pronoun. In the example below:

He''s got a beautiful car
beautiful is an adjective modifying car (it gives more information about the noun car.)

2. Adjectives may come before a noun

He found a nice job

3. Adjectives may also come after certain verbs like be, feel, seem, look:

He is intelligent
I feel happy
She seems unhappy 
They look fantastic
Adjectives versus adverbs
A distinction must be made between adjectives and adverbs.

1. An adjective modifies a noun or a pronoun.

She lives in a big house.

2. An adverb modifies a verb, an adjective or another adverb.

She sings well 
Her house is very big
She did it really well

Comparatives and superlatives
Adjectives can be used for comparison:

New York is bigger than Paris.
This is the nicest student in the class.

Other noun modifiers
There are other noun modifiers which function very much like adjectives:

1. Nouns can function as adjectives. A noun can help describe an object.

A business meeting

2. Past participle can also be used to modify a noun

He was exhausted
The hidden secret

3. Compound adjectives are used to modify nouns. They are called compound because they are made up of two or more words, usually with hyphens between them.

A heart-breaking news
An English-speaking country .', 2, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1048, N'The infinitive', N'11.jpg', 3, N'What is the infinitive?
The infinitive of a verb is its basic form with or without the particle to:

Examples:

do or to do
be or to be
The infinitive without to is called bare infinitive (do, )

The infinitive with to is called full infinitive (o do, to be)

The bare infinitive
The bare infinitive is used as the main verb after the dummy auxiliary verb do, or most modal auxiliary verbs (such as will, can, or should..)
Examples:
I do know him 
I do like you.
I can do it .
Several common verbs of perception, including see, watch, hear, feel, and sense take a direct object and a bare infinitive.
Examples:
I saw it happen
I watched it happen
The bare infinitive is also used with several common verbs of permission or causation, including make, bid, let, and have. 
Example:
I made/bade/let/had him do it. 
(However, make takes a to-infinitive in the passive voice.
I was made to do it.
The bare infinitive is also used after had better.
Example:
You had better leave now
The verb help is followed by the bare infinitive. 
Example:
He helped them do it. (He helped them to do it is also possible)
With the word why. 
Example:
Why say it?
The full infinitive
The full infinitive is used as follows:

The full infinitive can function as a noun phrase. In this case it is used as follows.
as a subject.
Examples:
To err is human, to forgive is divine.
as an object.
Examples:
I intended to marry her. 
He wanted to know the whole truth.
It can also be used like an adjective or adverb.
Examples:
This is the game to watch. (to watch functions as an adjective, modifying the noun game) 
This is the problem to think about. (to think about functions as an adjective modifying the noun ''the problem'') 
He went to his friend''s house to study. (to study functions as an adverb answering the question why he went to his friend''s house)
He is ready to go. (to go functions as an adverb, modifying the adjective ''eady.)
It is used to mean "in order to" to express purpose 
Examples:
You need to exercise regularly to lose weight. (...in order to lose weight)
He works hard to earn a lot of money. (...in order to earn a lot of money)', 3, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1049, N'Modal verbs and their meaning', N'14.gif', 3, N'What are modal verbs?

Modals (also called modal verbs, modal auxiliary verbs, modal auxiliaries) are special verbs which behave irregularly in English. They are different from normal verbs like "work, play, visit..." They give additional information about the function of the main verb that follows it. They have a great variety of communicative functions.
Here are some characteristics of modal verbs:

They never change their form. You can''t add "s", "ed", "ing"...
They are always followed by an infinitive without "to" (e.i. the bare infinitive.)
They are used to indicate modality allow speakers to express certainty, possibility, willingness, obligation, necessity, ability
List of modal verbs
can, could, may, might, will, would, shall, should, must

The verbs or expressions dare, ought to, had better, and need not behave like modal auxiliaries to a large extent and my be added to the above list

Use of modal verbs:
Modal verbs are used to express functions such as:

Permission
Ability
Obligation
Prohibition
Lack of necessity
Advice
possibility
probability
', 3, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1050, N'Present Perfect Simple', N'13.jpg', 3, N'The present perfect tense:
This page will present the present perfect simple:

its form
and its use.
You may also be interested in the present perfect continuous

The form of the present perfect simple tense:
Have (in the simple present) + Verb (in the past participle form)

Positive	Negative	Interrogative
I have worked.	I have not worked.	Have you worked?
NOTE:

I have worked = I''ve worked
He has worked = He''s worked	I have not = I haven''t worked 
He has not = He hasnÃ?Â¢??t worked
Examples:

Have you finished the job?
No, I haven''t finished yet.
Yes, I have already finished.
She''s just finished her job.
Remember:
The past participle of regular verbs is : 

Rule	Examples
Verb + ed	play - played 
visit - visited
finish -finished

The past participle of irregular verbs can''t be predicted (there is no rule .) But there is a list of irregular verbs that you have to learn by heart. Here are some examples:

Infinitive	Simple past	Past participle
be
come
go 
do
meet	was/were
came
went
did
met	been
come
gone
done
met
', 2, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 1)
INSERT [dbo].[Lesson] ([lessonID], [title], [imagePath], [category], [content], [difficulty], [audioPath], [isActive]) VALUES (1051, N'abbb', N'defaulImage', 1, N'abab', 1, N'defaultAudio                                                                                                                                                                                                                                                                                                ', 0)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
SET IDENTITY_INSERT [dbo].[LessonCategory] ON 

INSERT [dbo].[LessonCategory] ([cateID], [category]) VALUES (1, N'Reading')
INSERT [dbo].[LessonCategory] ([cateID], [category]) VALUES (2, N'Listening')
INSERT [dbo].[LessonCategory] ([cateID], [category]) VALUES (3, N'Grammar')
SET IDENTITY_INSERT [dbo].[LessonCategory] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (17, 24, N'What happened when the tomato first came to Europe?', N'It was welcomed vvnvn', N'People did not like it', N'Doctors suggested people eat tomatoes for good health', N'People grew it for food.', 2, 0)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (18, 24, N'What is something tomatoes are NOT used for?', N'Ketchup', N'Juice', N'Pastries', N'Soup', 1, 0)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (19, 24, N'What helps control the price of tomatoes in Canada?', N'The government passes laws to lower vegetable prices', N'Big farming companies use cheap workers from other countries', N'Consumer demand keeps prices down', N'Many people don''t like tomatoes', 2, 0)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (20, 24, N'According to the reading, how are the tomato workers treated unfairly', N'They work in unsafe conditions', N'Canadians are not polite to them', N'They are paid good wages', N'They are not allowed to stay in Canada', 4, 0)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (21, 24, N'When you are growing your own tomatoes, where should you put the plant and how much sunlight will it need?', N'You should put it in the kitchen and it will not need any direct sunlight.', N'You should put it by a window and it will need 4 hours of sunlight per day', N'It needs to be outside', N'It needs to be in the garage with sunlight all day', 2, 0)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (22, 25, N'What does David want to buy his Mother?', N'a special birthday present', N'a Christmas present', N'a spider ring', N'none of these', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (23, 25, N'Who does David get his money from?', N'his pet', N'his mother', N'his father', N'none of these', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (24, 25, N'How much money does David take to the mall?', N'$20.00', N'$5.00', N'$17.00', N'none of these', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (25, 25, N'What does David buy his mother?', N'a ring', N'a brooch', N'a spider', N'none', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (26, 25, N'What does David do with the present when he takes it home?', N'The gives it to his mother', N'he wraps it in Christmas paper', N'he is very excited', N'none', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (27, 25, N'Why does David''s mother scream?', N'because the present is beautiful', N'because she doesn''t like Christmas presents', N'because she thinks she sees a real spider', N'none', 3, 0)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (28, 25, N'Why does David buy a spider brooch?', N'spiders are his favourite pet', N'he loves Christmas', N'to scare his mother', N'none', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (29, 25, N'Where does David put the present on Christmas Eve?', N'under his pillow', N'under a spider', N'under the Christmas tree', N'none', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (30, 26, N'How many cornerstones does she have?', N'Two', N'Three', N'Four', N'None', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (31, 26, N'What does the head represeent? ', N'Gaining knowledge', N'Clearing your mind', N'Being a leader', N'none', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (32, 26, N'What does the heart represent? ', N'Having courage', N'Being kind to people', N'Having intuition', N'none', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (33, 26, N'What does the hand represent? ', N'Use it or lose it', N'Working hard', N'Helping others', N'none', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (34, 26, N'What does help represent? ', N'Asking for help', N'Teaching others', N'Working as a team', N'none', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (35, 27, N'What does David like to watch on TV? ', N'Sports', N'Movies', N'Cooking shows', N'none', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (36, 27, N'How many countries has he visited? ', N'26', N'24', N'27', N'none', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (37, 27, N'What did he do in Egypt? ', N'Ride a camel', N'Eat snake', N'Climb the pyramids', N'none', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (38, 27, N'What did he see in Peru? ', N'Inca people', N'Kefron', N'Machu Pichu', N'none', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (39, 27, N'When was it made? ', N'600 years ago', N'6,000 years ago', N'No one knows', N'none', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (40, 28, N'What does he have a view of? ', N'The Pacific Ocean', N'Lake Yamanaka', N'Mt. Fuji', N'none', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (41, 28, N'What does he jog around sometimes? ', N'A golf course', N'A lake', N'The campus', N'none', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (42, 28, N'For Kevin, what is the best thing about nature? ', N'The sounds', N'The view', N'The stress relief', N'none', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (43, 28, N'What is chaotic? ', N'The forests', N'His students', N'Tokyo', N'none', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (44, 28, N'What can you hear right now on the tape?', N'Birds', N'Insects', N'Cars', N'none', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (45, 29, N'Daniel''s great-grandma''s house always had ___. ', N'good food', N'new people', N'good books', N'many animals', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (46, 29, N'What did Daniel do at her house? ', N'Played with friends', N'Watched T.V.', N'Went to the beach', N'Cleaned', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (47, 29, N'How long did he go there when he was a kid? ', N'A few days', N'Three months', N'Three weeks', N'A weekend', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (48, 29, N'Daniel did ___ every day.? ', N'something different', N'the same thing', N'his homework', N'new things', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (49, 29, N'What is Vella''s definition of having fun? ', N'food', N'outside', N'soccer', N'friends', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (50, 30, N'Where hasn''t Daniel been? ', N'Asia', N'Africa', N'Europe', N'Antarctica', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (51, 30, N'How would Daniel see things from a different perspective? ', N'Scuba diving', N'Mountain climbing', N'Paragliding', N'Hot air balloon', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (52, 30, N'Daniel wants to see his children _____. ', N'succeed', N'get married', N'have children', N'win awards', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (53, 30, N'Daniel is afraid of ____. ', N'flying', N'snakes', N'heights', N'water', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (54, 30, N'Daniel says there are many ___ about Africa', N'movies', N'songs', N'books', N'myths', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1056, 1032, N'Are you Ready ', N'yes', N'NO', N'BOTH A & B', N'NOT A & B ', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1057, 24, N'Are you Ready ', N'yes', N'no', N'ok', N'yes', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1058, 24, N'What are something tomatoes are NOT used for?', N'ok', N'no', N'no', N'ok', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1059, 1037, N'1. She ________ in Florida but prefers California.', N'lives', N'goes', N'arrives', N'ok3by', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1060, 1037, N'When we ________ on vacation, we never fly.', N'are', N'go', N'went', N'', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1061, 1037, N'I ________ four languages, but I love Italian above all.', N'talk', N'speak', N'talks', N'', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1062, 1039, N' She was excited about the project.', N'Excited is an adjective', N'Excited is a past participle', N'', N'', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1063, 1039, N' I watched an interesting movie yesterday.', N'Interesting is an adjective', N'Interesting is a present participle', N'', N'', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1064, 1039, N'She was driving us crazy.', N'Driving is an adjective', N'Driving is a present participle', N'', N'', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1065, 1039, N' I hope you are fully recovered from your operation.', N'Recovered is an adjective', N'Recovered is a past participle', N'', N'', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1066, 1038, N'Last year I (go)  ______ to England on holiday.', N'go', N'went ', N'gone ', N'did', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1067, 1038, N'I ___________ about a yellow unicorn last night.', N'dreamed', N'slept', N'think', N'', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1068, 1038, N' Anna ___________ to class yesterday because she was at the hospital.', N'didn''t come', N'didn''t take', N'didn''t arrive', N'', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1069, 1040, N'How long has the writer of the story lived in the city?', N' A very long time', N'Not very long', N'  Ten years', N' She was born in the city.', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1070, 1040, N'What kind of vegetable did Val NOT grow?', N'Tomatoes', N'Carrots', N'Corn', N'Beans and peas', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1071, 1040, N'What happened after the writer of the story stopped seeing Val in her garden?', N' No one watered the garden.', N'People took many boxes from Val''s house.', N'Other neighbors took care of the garden.', N'Val''s house stayed empty.', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1072, 1040, N'Why was the new family lucky?', N'  They moved into a good neighborhood.', N' The had lots of friends in town.', N'They were lucky because the writer of the story took care of Val''s garden even after she died.', N' They had good jobs.', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1073, 1040, N'What is something that the writer of the story did NOT do after Val died?', N' pull the weeds', N'water the garden', N'talk to the plants', N' learn about Val''s family', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1074, 1041, N'Sue learned Japanese ________.', N'quickly', N'quick', N'quickest', N'quicker', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1075, 1041, N'Ann walks ________.', N'heavily', N'heavy', N'heaviest', N'heavier', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1076, 1041, N'Mei Li dresses ________.', N'beautiful', N'beautifully', N'more beautiful', N'most beautiful', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1077, 1041, N'I like to live in a ________ house.', N'cleaner', N'clean', N'cleanly', N'cleanest', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1078, 1041, N'The eagle sees ________.', N'good', N'better', N'best', N'well', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1079, 1041, N'Eric likes to sing ________ songs.', N'worst', N'worse', N'sad', N'sadly', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1080, 1041, N'The women work ________.', N'hardly', N'hard', N'harder', N'hardest', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1081, 1042, N'What is something that is difficult for Meg?', N'It is difficult for her to understand white people.', N'She can''t be creative.', N'It is hard for her to feed her children.', N' It is difficult for her to control the weeds in her garden.', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1082, 1042, N'What is Meg''s way of growing food?', N'She uses special seeds.', N' She gets help from her neighbors.', N' She keeps different kinds of fruits and vegetables in different sacks', N'  She puts different kinds of food in a sack that doesn''t need much room or water.', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1083, 1042, N'There is something Meg does not grow in the little holes in the side of the sack. What is it?', N'Tomatoes', N'Eggplant', N'A bean plant', N' Green pepper', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1084, 1042, N'Which of the following is NOT something good about Meg''s garden', N'It does not need much water.', N'It can grow a lot of food very quickly.', N'It does not need much space.', N' There are not many weeds in Meg''s garden.', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1085, 1042, N'Why doesn''t Meg grow food in the same way as other farmers?', N'There is not enough water.', N'  There are too many weeds.', N'It would cost too much money.', N' She does not have any land.', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1086, 1043, N'What can bugs do that make it hard to be a farmer?', N'They make your crops too dry.', N'They make your food go bad.', N' They can eat your crops.', N' They can make your food GM.', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1087, 1043, N'What is DNA?', N' It is something everyone needs to change.', N' Something about life that cannot be changed.', N' Something that is only in GM foods.', N'DNA is the part of every living thing that tells it how to grow.', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1088, 1043, N'According to the reading, what is something that GM food can NOT do?', N'It can make food grow in cold weather.', N'It can make food grow faster.', N' It might help grow food in dry parts of Africa.', N'GM food will help foods stay good longer.', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1089, 1043, N'What is the main reason we do not know enough about GM foods?', N' Famers don''t like GM foods.', N' Scientists need to do more testing to understand GM foods.', N' Insecticides proves that GM foods will survive bug infestations.', N'Companies just want to get rich.', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1092, 1044, N'Why did Randy make maps?', N'The maps help the loggers.', N'Randy makes maps to help campers.', N'He makes maps to show where Canada''s biggest trees are located.', N'He makes maps because he works for the government.', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1093, 1044, N'What did the loggers want to do to Canada''s tallest tree?', N' They wanted to cut it down.', N' Save the tree.', N' Take pictures of the tree.', N'Measure the tree to find out how tall it was.', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1094, 1044, N'Why did Randy make a path to the tallest tree in Canada?', N' He needed the path to get home.', N' He wanted more people to see it.', N'He made a path so he could visit the tree more easily.', N' He made a path to help the loggers get to the tree.', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1095, 1044, N'What does it mean to be "filled with awe".', N'  to be not interested', N' to be curious', N' to be amazed', N'to want money', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1096, 1044, N'What happened to the forest where Randy found Canada''s tallest tree?', N'The loggers might cut it down in the future.', N'No one knows. It is a mystery.', N'The loggers cut it down.', N'  It became a park.', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1097, 1045, N'Sue learned Japanese ________.', N'quickly', N'quick', N'quick', N'quick', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1098, 1045, N'I like to live in a ________ house.', N'clean', N'cleanly', N'cleanly', N'cleanly', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1099, 1045, N'Eric likes to sing ________ songs.', N'sad', N'sadly', N'worst', N'worse', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1100, 1046, N'What does David want to buy his Mother?', N'a special birthday present', N' a Christmas present', N' a spider ring', N' a spider ring', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1101, 1046, N'Who does David get his money from?', N' his pet', N'  his mother', N' his father', N'', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1102, 1046, N'How much money does David take to the mall?', N' $20.00', N'$5.00', N'17.00', N'', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1103, 1046, N'What does David buy his mother?', N' a ring', N' a brooch', N'a spider', N'', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1104, 1047, N' He is ______________ than his neighbors.', N'rich', N'richer', N'richest', N'the rich', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1105, 1047, N'The brides were much ______________than the grooms.', N'young', N'younger', N'youngest', N'the young', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1106, 1047, N'He is too ______________to be taught.', N'intelligent', N'more intelligent', N'most intelligent', N'the most intelligent', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1107, 1047, N'He is ______________than I thought him to be.', N'clever', N'cleverer', N'cleverest', N'the cleverest', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1108, 1047, N'When the old woman became ______________ she began to move about.', N'stronger', N'more strong', N'strong', N'strength', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1109, 1047, N' He is much ______________ now.', N'good', N'better', N'best', N'the best', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1110, 1047, N'The offer was too ______________ to be true.', N'good', N'better', N'best', N'the best ', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1111, 1048, N' She was excited about the project.', N'Excited is an adjective', N'Excited is a past participle', N'Excited is a present participle', N'Excited is a perfect participle', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1112, 1048, N' They have not been able to find the missing child.', N'Missing is an adjective', N'Missing is a present participle', N'BOTH A & B', N'NOT A & B ', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1113, 1048, N'She is retired now.', N'Retired is an adjective', N'Retired is a past participle', N'BOTH A & B', N'NOT A & B ', 2, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1114, 1048, N'It was beginning to rain.', N'Beginning is an adjective', N'Beginning is a present participle', N'BOTH A & B', N'NOT A & B ', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1115, 1049, N'I _________ call you tonight.', N'will', N'would', N'should', N'might', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1116, 1049, N'The contractor _____________ be responsible for the maintenance of the building and its premises.', N'shall', N'would', N'will', N'might', 3, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1117, 1049, N'I _________ give you a laptop for your birthday.', N'will', N'shall', N'BOTH A & B', N'Either could be used here', 4, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1118, 1049, N'What time ______________. I come and see you?', N'will', N'shall', N'would', N'might', 2, 1)
GO
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1119, 1049, N'What on earth ______________.. we do?', N'shall', N'may', N'would', N'might', 1, 1)
INSERT [dbo].[Question] ([questionID], [lessonID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption], [isActive]) VALUES (1120, 1049, N'______________ I get something to eat?', N'Will', N'Shall', N'Would', N'might', 2, 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[User_Response] ON 

INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (14, NULL, N'Lâm', N'ko thể làm quiz', N'', 0, N'lam@gmail.com', N'tại sao tôi ko thể làm quiz mặc dù đã login')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (15, NULL, N'Hoàng', N'ko thể mở file nghe', N'', 1, N'hoang@gmail.com', N'fiel nghe của bài ''ABC'' ko thể mở đc, ad fix lại nhé')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (16, NULL, N'', N'', N'', 0, N'', N'')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (1016, NULL, N'sss', N'123', N'', 1, N'batnb3@gmail.com', N'fiel nghe của bài ''ABC'' ko thể mở đc, ad fix lại nhéfiel nghe của bài ''ABC'' ko thể mở đc, ad fix lại nhéfiel nghe của bài ''ABC'' ko thể mở đc, ad fix lại nhéfiel nghe của bài ''ABC'' ko thể mở đc, ad fix lại nhé')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (2016, NULL, N'gdf', N'fgh', N'', 0, N'fgh', N'fghfgh')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (2017, NULL, N'gdf', N'fgh', N'', 0, N'fgh', N'fghfgh')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (2018, NULL, N'hl', N'hjl', N'', 0, N'hjl', N'hjl')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (2019, NULL, N'tutu', N'okok', N'', 0, N'okok', N'okok')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (2020, NULL, N'TuBa', N'web kha la hay', N'', 0, N'anhtunb98', N'can phat trien them chuc nang')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (2021, NULL, N'tu', N'web kha la hay', N'', 1, N'anhtunb98@gmail', N'okokok')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (2022, NULL, N'son ', N'kooko', N'', 0, N'bui anh tu', N'okokok')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (2023, NULL, N'xcvb', N'cvn', N'', 0, N'cnv', N'cvncvnc')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (2024, NULL, N'son', N'web nhu con cac ', N'', 0, N'sontxse05638', N'asjfhaksjfhakjsf')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (2025, NULL, N'BÃ¹i ANh TÃº', N'123456', N'', 0, N'tubase06155@fpt.edu.vn', N'web ráº¥t bá» Ã­ch ')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (2026, NULL, N'mra', N'ok', N'', 1, N'mra', N'web very ok ')
INSERT [dbo].[User_Response] ([responseID], [userID], [username], [title], [content], [isActive], [email], [content2]) VALUES (3021, NULL, N'mra', N'mra', N'', 0, N'mra', N'web ráº¥t lÃ  hay vÃ  bá» Ã­ch ')
SET IDENTITY_INSERT [dbo].[User_Response] OFF
SET IDENTITY_INSERT [dbo].[UserTBL] ON 

INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (17, N'user1', N'fpt123', N'user1@gmail.com', 2, 11, 0)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (18, N'admin', N'123', N'admin@gmail.com', 2, 0, 1)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (19, N'user2', N'123', N'user2@gmail.com', 1, 6, 1)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (20, N'user3', N'123', N'admin@gmail.com', 1, 55, 1)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (22, N'user4', N'fpt123', N'user4@gmail.com', 2, 23, 0)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (3039, N'user5', N'123', N'tutung', 1, 0, 0)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (3040, N'user6', N'123', N'anhtunb98', 1, 0, 0)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (3041, N'anhtu', N'123456', N'123456', 2, 1000000000, 1)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (3042, N'son', N'123', N'sontxse05638', 1, 168, 1)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (3043, N'4444', N'1', N'asg', 1, 0, 0)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (3044, N'tu', N'123', N'tubase06155@fpt.edu.vn', 1, 0, 1)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (3045, N'anhtu1', N'123', N'123', 1, 0, 1)
INSERT [dbo].[UserTBL] ([userID], [username], [password], [email], [userType], [score], [isActive]) VALUES (3046, N'mra', N'mra', N'mra', 1, 3, 1)
SET IDENTITY_INSERT [dbo].[UserTBL] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_User_username]    Script Date: 11/12/2018 9:30:08 AM ******/
ALTER TABLE [dbo].[UserTBL] ADD  CONSTRAINT [UK_User_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_category] FOREIGN KEY([category])
REFERENCES [dbo].[LessonCategory] ([cateID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_category]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_lessonID] FOREIGN KEY([lessonID])
REFERENCES [dbo].[Lesson] ([lessonID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_lessonID]
GO
ALTER TABLE [dbo].[User_Question_Answer]  WITH CHECK ADD  CONSTRAINT [FK_User_Question_Answer_questionID] FOREIGN KEY([questionID])
REFERENCES [dbo].[Question] ([questionID])
GO
ALTER TABLE [dbo].[User_Question_Answer] CHECK CONSTRAINT [FK_User_Question_Answer_questionID]
GO
ALTER TABLE [dbo].[User_Question_Answer]  WITH CHECK ADD  CONSTRAINT [FK_User_Question_Answer_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[UserTBL] ([userID])
GO
ALTER TABLE [dbo].[User_Question_Answer] CHECK CONSTRAINT [FK_User_Question_Answer_userID]
GO
ALTER TABLE [dbo].[User_Response]  WITH CHECK ADD  CONSTRAINT [FK_User_Response_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[UserTBL] ([userID])
GO
ALTER TABLE [dbo].[User_Response] CHECK CONSTRAINT [FK_User_Response_userID]
GO
USE [master]
GO
ALTER DATABASE [FunEnglish] SET  READ_WRITE 
GO
