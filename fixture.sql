insert or ignore into users(id, username, api_key)
values (1, 'me', 'api_key')
;

insert or ignore into categories(id, user_id, name)
values (1, 1, 'General'),
       (2, 1, 'Comics'),
       (3, 1, 'Development')
;

insert or ignore into feeds(id, kind, title, link, feed)
values (1, 'RSS', 'Hacker News', 'https://news.ycombinator.com', 'https://news.ycombinator.com/rss'),
       (2, 'RSS', 'xkcd', 'https://xkcd.com', 'http://xkcd.com/rss.xml'),
       (3, 'RSS', 'JetBrains Blog', 'https://blog.jetbrains.com', 'http://blog.jetbrains.com/feed/'),
       (4, 'RSS', 'React', 'https://reactjs.org', 'https://reactjs.org/feed.xml')
;

insert or ignore into category_feeds(category_id, feed_id)
values (1, 1),
       (2, 2),
       (3, 3),
       (3, 4)
;
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (1, 1, 'https://savo.la/introduction-to-gate.html', 'Introduction to Gate', '2019-12-09T17:50:17+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21744688" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21744688');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (2, 1, 'https://www.wsj.com/articles/five-cities-account-for-vast-majority-of-growth-in-tech-jobs-study-finds-11575867660', 'Five cities account for vast majority of growth in U.S. tech jobs: study', '2019-12-09T14:56:35+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21743129" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21743129');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (3, 1, 'https://fivebooks.com/best-books/science-2019-barbara-kiser/', 'Science Books of 2019', '2019-12-09T17:59:35+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21744772" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21744772');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (4, 1, 'https://www.theatlantic.com/ideas/archive/2019/11/why-child-care-so-expensive/602599', 'Why Child Care Is So Expensive', '2019-12-09T18:41:48+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21745124" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21745124');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (5, 1, 'http://scholar.harvard.edu/files/mickens/files/towashitallaway.pdf', 'To Wash It All Away (2014) [pdf]', '2019-12-09T18:00:56+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21744785" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21744785');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (6, 1, 'https://github.com/infostreams/db', 'Show HN: Version Control for Databases', '2019-12-09T13:06:35+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21742222" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21742222');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (7, 1, 'https://jamesmunns.com/blog/fmt-unreasonably-expensive/', 'Formatting Is Unreasonably Expensive for Embedded Rust', '2019-12-09T15:41:11+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21743513" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21743513');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (8, 1, 'https://www.jefftk.com/p/long-bets-by-confidence-level', 'Long Bets by Confidence Level', '2019-12-09T14:38:39+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21742978" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21742978');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (9, 1, 'https://www.bloomberg.com/news/articles/2019-12-08/repo-blowup-was-fueled-by-big-banks-and-hedge-funds-bis-says', 'Repo Blowup Was Fueled by Big Banks and Hedge Funds, BIS Says', '2019-12-09T14:05:49+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21742702" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21742702');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (10, 1, 'https://www.nytimes.com/2019/12/09/business/paul-a-volcker-dead.html', 'Paul Volcker has died', '2019-12-09T14:10:09+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21742731" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21742731');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (11, 1, 'https://johnaugust.com/2018/missing-movies', 'Missing Movies (2018)', '2019-12-09T12:45:13+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21742110" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21742110');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (12, 1, 'https://www.wsj.com/articles/american-factories-demand-white-collar-education-for-blue-collar-work-11575907185', 'College-educated workers are taking over the American factory floor', '2019-12-09T19:43:30+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21745704" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21745704');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (13, 1, 'https://queue.acm.org/detail.cfm?id=3341158', 'Must and Must Not: On writing documentation', '2019-12-09T14:53:02+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21743100" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21743100');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (14, 1, 'https://emacsair.me/2017/09/01/magit-walk-through/', 'A walk through the Magit interface', '2019-12-07T10:55:30+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21729597" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21729597');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (15, 1, 'https://web.archive.org/web/20030812081713/http://klausler.com/cnotes.txt', 'Some things every C programmer should know about C (2002)', '2019-12-09T15:59:55+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21743696" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21743696');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (16, 1, 'https://effectiviology.com/jumping-to-conclusions/', 'Jumping to Conclusions: When People Decide Based on Insufficient Information', '2019-12-10T01:03:09+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21748589" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21748589');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (17, 1, 'https://www.bloomberg.com/news/articles/2019-12-09/vietnam-s-richest-man-bets-2-billion-to-sell-cars-to-americans', 'Vietnam’s Richest Man Bets $2B to Sell Cars to Americans', '2019-12-09T23:13:16+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21747710" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21747710');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (18, 1, 'http://www.2arms1head.com/', 'Two Arms and a Head (2011)', '2019-12-07T07:51:57+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21729056" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21729056');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (19, 1, 'https://www.quantamagazine.org/how-simple-rules-bootstrap-the-laws-of-physics-20191209/', 'Simple Rules ‘Bootstrap’ the Laws of Physics', '2019-12-09T16:20:49+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21743847" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21743847');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (20, 1, 'https://news.ycombinator.com/item?id=21743302', 'Ask HN: We are shutting down our startup, I get our code. What now?', '2019-12-09T15:17:05+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21743302" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21743302');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (21, 1, 'https://blog.letsenhance.io/all/2019/07/09/computational-photographyfrom-selfies-to-black-holes/', 'Computational photography from selfies to black holes', '2019-12-09T22:10:43+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21747175" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21747175');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (22, 1, 'https://www.nytimes.com/2019/12/08/obituaries/caroll-spinney-dead.html', 'Caroll Spinney has died', '2019-12-08T19:31:16+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21737697" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21737697');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (23, 1, 'https://signal.org/blog/signal-private-group-system/', 'Technology Preview: Signal Private Group System', '2019-12-09T17:10:11+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21744274" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21744274');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (24, 1, 'https://www.sametab.com/blog/operations-and-internal-communication-strategies-for-effective-ceos', 'Operations for Effective CEOs', '2019-12-09T14:11:22+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21742739" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21742739');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (25, 1, 'https://hbr.org/2017/09/the-grocery-industry-confronts-a-new-problem-only-10-of-americans-love-cooking', 'Grocery Industry Confronts a Problem: Only 10% of Americans Love Cooking (2017)', '2019-12-09T22:41:20+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21747446" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21747446');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (26, 1, 'https://www.evanjones.ca/ordered-vs-unordered-indexes.html', 'Why databases use ordered indexes but programming uses hash tables', '2019-12-08T22:20:15+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21738802" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21738802');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (27, 1, 'https://randomascii.wordpress.com/2019/12/08/on2-again-now-in-wmi/', 'O(n^2), again, now in Windows Management Instrumentation', '2019-12-09T15:30:35+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21743424" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21743424');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (28, 1, 'https://www.theinformation.com/articles/apples-ad-targeting-crackdown-shakes-up-ad-market?pu=hackernews4qs3ac&utm_source=hackernews&utm_medium=unlocka', 'Apple’s Ad-Targeting Crackdown Shakes Up Ad Market', '2019-12-09T22:14:34+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21747217" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21747217');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (29, 1, 'https://blog.cynthia.re/post/nintendo-switch-ethernet-switch', 'The Nintendo Switch Switch', '2019-12-09T19:46:52+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21745731" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21745731');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (30, 1, 'https://en.wikipedia.org/wiki/Transputer', 'Transputer', '2019-12-09T21:22:57+00:00', 'Comments', '<a href="https://news.ycombinator.com/item?id=21746739" rel="noopener noreferrer">Comments</a>', null, null, 'https://news.ycombinator.com/item?id=21746739');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (31, 2, 'https://xkcd.com/2236/', 'Is it Christmas?', '2019-12-02T05:00:00+00:00', '', '<img src="https://imgs.xkcd.com/comics/is_it_christmas.png" title="We''ve tested it on 30 different days and it hasn''t gotten one wrong yet." alt="We''ve tested it on 30 different days and it hasn''t gotten one wrong yet.">', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (32, 2, 'https://xkcd.com/2237/', 'AI Hiring Algorithm', '2019-12-04T05:00:00+00:00', '', '<img src="https://imgs.xkcd.com/comics/ai_hiring_algorithm.png" title="So glad Kate over in R&amp;D pushed for using the AlgoMaxAnalyzer to look into this. Hiring her was a great decisio- waaaait." alt="So glad Kate over in R&amp;D pushed for using the AlgoMaxAnalyzer to look into this. Hiring her was a great decisio- waaaait.">', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (33, 2, 'https://xkcd.com/2238/', 'Flu Shot', '2019-12-06T05:00:00+00:00', '', '<img src="https://imgs.xkcd.com/comics/flu_shot.png" title="&quot;Wait, how often are you getting bitten by snakes? And why are you boiling water?&quot; &quot;Dunno, the CDC people keep showing up with complicated questions about the ''history of the property'' and ''possible curses'' but I kinda tune them out. At least one of them offered me the flu shot.&quot;" alt="&quot;Wait, how often are you getting bitten by snakes? And why are you boiling water?&quot; &quot;Dunno, the CDC people keep showing up with complicated questions about the ''history of the property'' and ''possible curses'' but I kinda tune them out. At least one of them offered me the flu shot.&quot;">', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (34, 2, 'https://xkcd.com/2239/', 'Data Error', '2019-12-09T05:00:00+00:00', '', '<img src="https://imgs.xkcd.com/comics/data_error.png" title="Cyanobacteria wiped out nearly all life on Earth once before, and they can do it again!" alt="Cyanobacteria wiped out nearly all life on Earth once before, and they can do it again!">', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (35, 3, 'https://blog.jetbrains.com/blog/2019/07/16/welcome-edutools-plugin-v2-7/', 'Welcome EduTools plugin v2.7: YAML support, Algorithmic Toolbox by Coursera, and more', '2019-07-16T15:51:47+00:00', 'Our newest plugin update to v2.7 comes with YAML support for course creators, multiple-choice task support, new courses, and 2019.1.2 IDE builds for PyCharm Edu and IntelliJ IDEA Edu. YAML support Course creators, welcome a completely reworked solution for course … Continue reading →', '<p>Our newest plugin update to v2.7 comes with YAML support for course creators, multiple-choice task support, new courses, and 2019.1.2 IDE builds for PyCharm Edu and IntelliJ IDEA Edu.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/1500x800_new1.png" alt="1500x800_new1" width="1500" height="800"></p>
<h2>YAML support</h2>
<p>Course creators, welcome a completely reworked solution for course configuration files storage! Previously, all course metadata was stored in XML format. Now you can see all the information about your course conveniently stored in YAML format. We worked hard to make this possible and we hope that you will like the YAML support as much as we do.</p>
<p><span></span></p>
<p>YAML has a number of advantages such as:</p>
<ul>
<li>Simple and understandable structure of configuration files</li>
<li>Easy VCS storage with a more clear <strong>diff</strong></li>
<li>Highlighting for invalid values and suggestions of available variants for values in completions</li>
<li>Lightweight and readable document appearance achieved by the reduction of tags and delimiters</li>
</ul>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/post27_yaml.png" alt="post27_yaml" width="1504" height="568"></p>
<p><a href="https://www.jetbrains.com/help/education/meet-yaml-format.html" rel="noopener noreferrer">Read the documentation</a> for more information about YAML and new configuration guides.</p>
<p>You can also take a quick look at a YAML guide in the Course Creator mode – select <em>YAML Help</em> tab next to the <em>Task Description</em> panel.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/post27_yaml_2.png" alt="post27_yaml_2" width="1764" height="354"></p>
<h2>Multiple-choice tasks</h2>
<p>We’ve added multiple-choice tasks support for courses created via the plugin (previously, only choice tasks from Stepik courses were supported).</p>
<p>To create a multiple-choice task:<br>
– open the <em>task-info.yaml</em> file<br>
– set <strong><em>type</em></strong> to <strong><em>choice</em> </strong><br>
– set <strong><em>true</em></strong> or <strong><em>false</em></strong> for <strong><em>is_multiple_choice</em></strong> field<br>
– add properties for task options</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/post27_choice.png" alt="post27_choice" width="1810" height="616"></p>
<h2>New courses</h2>
<h3>Scala Tutorial</h3>
<p>Our new featured <strong>Scala Tutorial</strong> course provides a quick intro to the Scala programming language. Its content is based on the open source <a href="https://www.scala-exercises.org/" rel="noopener noreferrer">Scala Tutorial</a> and covers the basics of functional and object-oriented programming in a hands-on series of exercises.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/post27_scala_1.png" alt="post27_scala_1" width="2238" height="1114"></p>
<p>Install the <a href="https://plugins.jetbrains.com/plugin/1347-scala" rel="noopener noreferrer">Scala plugin</a> or download the <a href="https://www.jetbrains.com/education/download/#section=idea-Scala" rel="noopener noreferrer">IntelliJ IDEA Edu with the bundled Scala plugin</a>, go to <em>File | Learn and Teach | Browse courses</em>, select <strong>Scala Tutorial</strong>, and get ready to learn!</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/post27_scala_2.png" alt="post27_scala_2" width="1488" height="862"></p>
<h3>Algorithmic Toolbox by Coursera</h3>
<p>The <a href="https://www.coursera.org/learn/algorithmic-toolbox?specialization=data-structures-algorithms" rel="noopener noreferrer">Algorithmic Toolbox</a> course on Coursera is a part of the specialization “<a href="https://www.coursera.org/specializations/data-structures-algorithms" rel="noopener noreferrer">Data Structures and Algorithms</a>”. The course covers basic algorithmic techniques and ideas for computational problems arising frequently in practical applications: sorting and searching, divide and conquer, greedy algorithms, and dynamic programming.</p>
<p><a href="https://www.coursera.org/learn/algorithmic-toolbox?specialization=data-structures-algorithms" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/post27_at_2.png" alt="Image by coursera.org" width="2206" height="1284"></a><br>
<em>Image by <a href="https://www.coursera.org/learn/algorithmic-toolbox?specialization=data-structures-algorithms" rel="noopener noreferrer">coursera.org</a></em></p>
<p>Since the course was introduced, learners have been able to complete programming assignments in various programming languages. Now, for those students who are submitting solutions in Python, the course provides integration with the EduTools plugin and encourages learners to solve programming challenges in PyCharm Edu before submitting the solution on the course page. As a professional IDE, PyCharm Edu helps learners format and structure their code, as well as test and debug it.</p>
<p>Go to <em>File | Start Coursera Assignment </em>and select <strong>Algorithmic Toolbox</strong>. Solve programming assignments and submit them to Coursera.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/post27_at_1.png" alt="post27_at_1" width="1382" height="878"></p>
<p>Note that the course is featured on <a href="https://www.coursera.org/" rel="noopener noreferrer">Coursera</a> and is a paid one. You can still solve tasks and run basic local test cases for free, but you need to join the course on Coursera to submit, verify on a large number of test cases and get a certificate. At Coursera, a trial period and financial aid are available.</p>
<h2>IntelliJ IDEA Edu and PyCharm Edu 2019.1.2</h2>
<p>Please welcome the IDE builds for PyCharm Edu 2019.1.2 and IntelliJ IDEA Edu 2019.1.2 (IntelliJ IDEA Community Edition with the EduTools plugin). They combine the builds for <a href="https://blog.jetbrains.com/pycharm/2019/06/pycharm-2019-1-3/" rel="noopener noreferrer">PyCharm 2019.1.3</a> and <a href="https://blog.jetbrains.com/idea/2019/05/intellij-idea-2019-1-3-is-here/" rel="noopener noreferrer">IntelliJ IDEA 2019.1.3</a> and the latest plugin updates in v2.7.</p>
<p><a title="Download Educational IDEs" href="https://www.jetbrains.com/education/download/" rel="noopener noreferrer"><i></i>CHOOSE YOUR EDU IDE</a></p>
<p><em>Your Educational Products Team</em></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/07/16/welcome-edutools-plugin-v2-7/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (36, 3, 'https://blog.jetbrains.com/blog/2019/07/23/an-interview-with-jakub-chrzanowski-ignore-plugin-author/', 'An Interview with Jakub Chrzanowski, .ignore Plugin Author', '2019-07-23T14:56:15+00:00', 'In this interview, we speak with Jakub Chrzanowski (@hsz @hszanowski), the author of the .ignore plugin for the IntelliJ-based IDEs. This plugin lets you mark matched .ignore files in project view, assists with editing them, and helps you generate ignore … Continue reading →', '<p><em>In this interview, we speak with Jakub Chrzanowski (<a href="https://github.com/hsz" rel="noopener noreferrer">@hsz</a> <a href="https://twitter.com/hszanowski" rel="noopener noreferrer">@hszanowski</a>), the author of the <a href="https://plugins.jetbrains.com/plugin/7495--ignore" rel="noopener noreferrer">.ignore plugin</a> for the IntelliJ-based IDEs. This plugin lets you mark matched .ignore files in project view, assists with editing them, and helps you generate ignore rules using templates.</em></p>
<p><strong>Welcome, Jakub! Before we get started, could you please tell us a bit about yourself and your background?</strong></p>
<p>I started my development journey in primary school with Pascal. I had strong support from my teacher and his code listings from a dot-matrix printer. That was a very exciting beginning for a young fellow and sometimes I miss it a bit. Over the next 18 years, I explored some other programming languages like C, Perl, Java, PHP, and C# and ending, for now, with NodeJS, TypeScript, and Kotlin. My focus has mainly been on the web development and DevOps with a touch of JetBrains plugins crafting in my free time.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/jb5.jpg" alt="Jakub Chrzanowski" width="1000" height="706"></p>
<p><strong>What is the .ignore plugin and how did it come about?</strong></p>
<p>The .ignore plugin is a tool that helps developers handle .gitignore files in a more complex format than just a plain text file with some glob-like rules. The main features of the plugin are:</p>
<ul>
<li>Syntax highlighting,</li>
<li>Marking ignored files in the Project View,</li>
<li>Providing predefined templates from <a href="https://github.com/github/gitignore" rel="noopener noreferrer">https://github.com/github/gitignore</a>,</li>
<li>Custom user templates.</li>
</ul>
<p><span></span></p>
<p>In addition to the basic functionality that was provided at the very beginning of the project, many smaller integrations with the IDE itself can be found. Support for subsequent file types is constantly being added too, because it is not only .gitignore files that are supported. Files such as .dockerignore, .npmignore, .prettierignore, and .hgignore (Mercurial version control system that uses both glob and regex rules) are handled, plus many others whose support has been requested by the users.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/image4.png" alt="image4" width="944" height="534"></p>
<p><strong>Why did you decide to create the plugin and what’s your motivation for its continued development over the years?</strong></p>
<p>Just over five years ago, at my previous company we were using Git and PhpStorm for some work around the Symfony framework and WordPress add-ons. The project structure was a bit tricky and .gitignore was used heavily, but unfortunately, there was no built-in support for the project files tree coloring in the IDE. I had seen this kind of feature probably in Eclipse before and thought that it would be pretty handy to have it here as well. After digging into the IntelliJ IDEA SDK and some other open-source plugins on GitHub and a few days of work in the basement (literally), I had finally managed to handle <a href="https://github.com/JetBrains/idea-gitignore/commit/5b8dbab31af5b805fc402d7686a591215072844" rel="noopener noreferrer">very basic syntax coloring</a>.</p>
<p>After releasing this version, the first feature request appeared in the <a href="https://github.com/JetBrains/idea-gitignore/issues/1" rel="noopener noreferrer">GitHub issues</a>&nbsp;in relation to making some use of the community-driven gitignore templates repository hosted by GitHub itself.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/image1.png" alt="image1" width="873" height="625"></p>
<p>Over the next few years, lots of ideas appeared: some good ones, but also some not-so-good ones. The SDK evolved and new IDEs were released (CLion, Rider), which caused me a little bit of trouble, and as I am not a JetBrains developer, it could be tricky to work with some core functionalities in the proper way. There was always something to do and because of the growing community, I felt obliged to deliver something that would be helpful and free from bugs. The download statistics and community support always gave me an additional boost so that it was (almost ;-)) always fun.</p>
<p><strong>What is the current state of the plugin and what are the plans for its future development and features?</strong></p>
<p>Currently, the .ignore plugin is in a maintenance phase and supports the IDEs in versions from 2017.1 to 2019.1.3. The decision to limit the support for the 2019.2 was made together with JetBrains because there is native support for .gitignore planned in the next IDE versions and this will avoid some functionality conflicts.</p>
<p>For now, the .ignore plugin repository has been <a href="https://blog.jetbrains.com/idea/2019/07/support-for-vcs-ignores-in-intellij-idea-and-intellij-based-ides" rel="noopener noreferrer">transferred to the JetBrains</a> organization account.</p>
<p><strong>Have you developed any other plugins for IntelliJ-based IDEs?</strong></p>
<p>Currently I am working on the extension for Search Everywhere called <a href="https://github.com/hsz/intellij-packages-search" rel="noopener noreferrer">Packages Search</a>. It will let you quickly search for the packages/dependencies across the NPM/Maven/Packagist/PyPi repositories and present the results with the item details (plus maybe some quick install/update actions). A <a href="https://twitter.com/hszanowski/status/1127864685259304962" rel="noopener noreferrer">proof of concept video</a> was recently published on my Twitter as well as a <a href="https://twitter.com/hszanowski/status/1151006002604650496" rel="noopener noreferrer">call for plugin testers</a>.</p>
<p>A few years back I also started working on the LaTeX plugin which I have since put on hold because of some time limitations and a lack of knowledge about the lexer. But no worries – it is going to be rebooted, rewritten with Kotlin, and include all of the good practices I’ve learned since then.</p>
<p>There were also some other small plugins that didn’t really get any attention and this is totally fine, because not everything that we develop has to be a must-have-killer-feature. But we have to keep trying. <img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-includes/images/smilies/simple-smile.png" alt=":-)"></p>
<p><strong>Can you tell us what you liked about the plugin development process and what could be improved?</strong></p>
<p>The process for the development of plugins has improved over recent years. It is now very easy to set up a basic plugin scaffold using Gradle and the Kotlin language, which I’d personally recommend to everyone. The deployment process is very simple thanks to the <a href="https://github.com/JetBrains/gradle-intellij-plugin" rel="noopener noreferrer">gradle-intellij-plugin</a> and allows you to create a nice CI/CD process.</p>
<p>The only thing that can get a bit complicated is supporting multiple IDE versions (2016.x, … 2019.x) because of the differences in the SDKs and the deprecations/new features. It requires some branching model in the git repository – there is probably a better way to do it, but that was enough for me at this point.</p>
<p><strong>Do you have any recommendations or tips for anyone who wants to build on top of the IntelliJ Platform?</strong></p>
<p>Besides the <a href="http://www.jetbrains.org/intellij/sdk/docs/welcome.html" rel="noopener noreferrer">official SDK documentation</a>, which may be useful at the beginning, I can definitely recommend searching the plugin repository, which allows you to filter the results for the referenced plugins’ source code.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/image2.png" alt="image2" width="1338" height="481"></p>
<p>Checking the sources of others can be a great inspiration and a real time saver.<br>
Also, you have to remember about communication – ask other developers for help if you get stuck, ask for a review, test, and try to publish your plugin to a wider audience. Building the community around your open source project is just as important as the time you invest in your work.</p>
<p><em>Thank you Jakub for taking the time to chat with us and for your work on the .ignore plugin for the IntelliJ-based IDEs.</em></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/07/23/an-interview-with-jakub-chrzanowski-ignore-plugin-author/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (37, 3, 'https://blog.jetbrains.com/blog/2019/07/30/data-science-survey-2018-raw-data-available/', 'Data Science Survey 2018: Raw Data Available', '2019-07-30T09:53:43+00:00', 'In the spring of 2018, we conducted the Data Science survey where we asked people from all over the world working with data to tell us about their work, tools, and practices. We distributed this survey via targeted ads on … Continue reading →', '<p>In the spring of 2018, we conducted the <a href="https://blog.jetbrains.com/blog/2018/11/12/data-science-survey-2018-results-by-numbers/" rel="noopener noreferrer">Data Science survey</a> where we asked people from all over the world working with data to tell us about their work, tools, and practices. We distributed this survey via targeted ads on Facebook, LinkedIn, and Twitter to reduce any possible bias in the results towards our JetBrains audience. We collected about 400 sets of responses from the USA, Japan, and China, and used quotas to get another 400 responses from European countries.</p>
<p>The main results of the research are presented in our <strong><a href="https://www.jetbrains.com/research/data-science-2018/" rel="noopener noreferrer">Data Science 2018 infographics</a></strong>. And now we’ve also made the <strong>raw data available for download</strong>.</p>
<p><a href="https://www.kaggle.com/jetbrains/datascience2018" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/preview_1280x800.png" alt="Data Science Survey 2018: Raw data available" width="1280" height="800"></a></p>
<p>To make the data more discoverable and easier to analyze, we’ve created a <strong><a href="https://www.kaggle.com/jetbrains/datascience2018" rel="noopener noreferrer">dataset on the Kaggle platform</a></strong>. This dataset is distributed under a Creative Commons Attribution 4.0 license. We’ve also prepared a <a href="https://www.kaggle.com/testlnord/datascience-infographics" rel="noopener noreferrer">kernel with a set of useful functions</a> that may help you analyze the data.</p>
<p>Go ahead, start digging into the data, and don’t forget to <strong>join our <a href="https://www.jetbrains.com/research/data-science-2018/#subscribe" rel="noopener noreferrer">Survey Panel</a></strong>!</p>
<p>JetBrains<br>
The Drive to Develop</p>
<p><em>P.S. To start working with the dataset (e.g. download the data or copy and edit the kernel), you have to be registered on Kaggle. It’s free.</em></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/07/30/data-science-survey-2018-raw-data-available/#comments');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (38, 3, 'https://blog.jetbrains.com/blog/2019/08/01/educational-products-2019-2-are-here/', 'Educational Products 2019.2 Are Here!', '2019-08-01T13:34:54+00:00', 'Please give a warm welcome to Educational Products 2019.2! Enjoy upgraded IDEs for Education and the EduTools plugin v2.8, use the unittest framework for Python courses, and get ready to learn with our brand new courses. IDEs for Education Both … Continue reading →', '<p>Please give a warm welcome to Educational Products 2019.2! Enjoy upgraded IDEs for Education and the EduTools plugin v2.8, use the <code>unittest</code> framework for Python courses, and get ready to learn with our brand new courses.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/blog.png" alt="Edu_2019_2" width="1280" height="800"></p>
<h2>IDEs for Education</h2>
<p>Both of our IDEs that offer an immersive learning experience – PyCharm Edu and IntelliJ IDEA Edu (Community Educational with the bundled EduTools plugin) – have been updated to v2019.2, combining the best of major IDE releases with the latest EduTools plugin.</p>
<p><span></span></p>
<p>In addition to all the fresh features we’ve just rolled out in PyCharm 2019.2 and IntelliJ IDEA 2019.2, the Educational versions of both IDEs come with the following improvements:</p>
<ul>
<li><code>YAML</code> configuration files for managing course structure in educator mode. Read more about <code>YAML</code> support <a href="https://www.jetbrains.com/help/education/meet-yaml-format.html" rel="noopener noreferrer">here</a>.</li>
<li>Multiple-choice tasks for local courses (previously, only choice tasks from Stepik were supported).</li>
<li>While you create a new course, you don’t have to specify the author anymore. Add the author’s name only when generating a local course archive.</li>
<li>Checking in Gradle-based courses is now a lot faster.</li>
</ul>
<p>Specifically, PyCharm Edu 2019.2 offers the following as well:</p>
<ul>
<li><code>unittest</code> is now the default framework for tests when creating Python courses (but old tests are still supported for existing courses).</li>
<li>Test results can be viewed in <em><strong>Test View</strong></em> in the Educator mode.</li>
</ul>
<p><a title="Download Educational IDEs" href="https://www.jetbrains.com/education/download/" rel="noopener noreferrer"><i></i>CHOOSE YOUR EDU IDE</a></p>
<h2>EduTools 2.8</h2>
<p>The latest EduTools plugin upgrade is here to give you:</p>
<ul>
<li>Python: <code>unittest</code> is now the default framework for tests in Python courses (but old tests are still supported for existing courses).</li>
<li>Rust: Cargo workspaces are now used to load courses faster in the Learner mode.</li>
<li>Issues with <code>YAML</code> have been fixed.</li>
</ul>
<p>Check out the plugin <a href="https://plugins.jetbrains.com/plugin/10081-edutools" rel="noopener noreferrer">release notes</a> and upgrade now!</p>
<h2>Unit tests for Python</h2>
<p>We’ve replaced our custom Python tests with the <code>unittest</code> framework. Now course creators can add verification tests using this test library:</p>
<ul>
<li>Course creators can now use <code>unittest</code> – one of the most popular testing frameworks, instead of getting used to our custom Python tests. This enables easy navigation between tests and their output in the <em><strong>Run</strong></em> tool window and more convenient workflow for developers already familiar with the library.</li>
<li>Learners now can get an expected/actual results comparison in the <strong><em>Task Description</em></strong> panel and check the <code>diff</code> right away with the <strong><em>Compare</em></strong> outputs action to check what exactly went wrong.</li>
</ul>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/07/2019-07-31_21-13-23.png" alt="2019-07-31_21-13-23" width="1700" height="586"></p>
<h2>New courses</h2>
<p>Enjoy our new courses that cover topics from algorithms to new languages to programming basics.</p>
<ul>
<li><a href="https://www.coursera.org/learn/algorithmic-toolbox?specialization=data-structures-algorithms" rel="noopener noreferrer">Algorithmic Toolbox</a> by Coursera is a part of the <a href="https://www.coursera.org/specializations/data-structures-algorithms" rel="noopener noreferrer">Data Structures and Algorithms</a> specialization. The course covers basic algorithmic techniques and ideas for computational problems arising frequently in practical applications: sorting and searching, divide and conquer, greedy algorithms, and dynamic programming. For students submitting solutions in Python, the course now provides integration with the EduTools plugin and encourages learners to solve programming challenges in PyCharm Edu before submitting the solution on the course page.</li>
<li>Apache Beam Katas is a course that provides a series of structured hands-on lessons to get started with <a href="https://beam.apache.org/" rel="noopener noreferrer">Apache Beam</a>. Solve exercises of gradually increasing complexity and get experience with all the Apache Beam fundamentals such as core transforms, common transforms, and simple use cases (word count), with more katas on the way.</li>
<li>Scala Tutorial provides a quick intro to the Scala programming language. Its content is based on the open source <a href="https://www.scala-exercises.org/" rel="noopener noreferrer">Scala Tutorial</a> and covers the basics of functional and object-oriented programming in a hands-on series of exercises.</li>
<li>C++ is now available for Russian-language learners with two new courses on the Stepik learning platform: “<a href="https://stepik.org/course/7/promo" rel="noopener noreferrer">Программирование на языке C++</a>” and “<a href="https://stepik.org/course/3206/promo" rel="noopener noreferrer">Программирование на языке С++: продолжение</a>”.</li>
</ul>
<p><em>Your Educational Tools team</em></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/08/01/educational-products-2019-2-are-here/#comments');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (39, 3, 'https://blog.jetbrains.com/blog/2019/08/13/developer-ecosystem-survey-2019-raw-data-available/', 'Developer Ecosystem Survey 2019: Raw Data Available', '2019-08-13T14:35:46+00:00', 'To monitor the rapidly changing State of the Developer Ecosystem, we, at JetBrains every year conduct a comprehensive survey to represent the developers in the world. Earlier this year we presented the results of the research in our Developer Ecosystem … Continue reading →', '<p>To monitor the rapidly changing State of the Developer Ecosystem, we, at JetBrains every year conduct a comprehensive survey to represent the developers in the world.</p>
<p>Earlier this year we presented the results of the research in our <a href="https://www.jetbrains.com/lp/devecosystem-2019/" rel="noopener noreferrer">Developer Ecosystem Infographic</a>. You can find plenty of interesting charts and facts we have carefully prepared for you in it. But imagine, how many hidden insights the data may still contain. The survey consisted of more than 300 questions in addition to the ones presented in the infographic.</p>
<p><a href="https://drive.google.com/drive/u/1/folders/1Et4ZzWXvVfW84ylw0fUbQnaJWGZRFiQg" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/RawData_800x418.png" alt="The Raw Data is In" width="800" height="418"></a></p>
<p>Now, as usual, we are publicly sharing the raw data of the survey responses. So you can dig deeper and find your own amazing facts.&nbsp;<a href="https://drive.google.com/file/d/1MsftN3BXhZKE2JzGTQZvs_GRNuaaw0Xn/view?usp=sharing" rel="noopener noreferrer">Via the link</a>, you can find the survey questions and survey logic as well.</p>
<p>&nbsp;<a title="Get Developer Ecosystem Survey 2019 Raw Data" href="http://jb.gg/devecosystem2019raw" rel="noopener noreferrer">Get Developer Ecosystem Survey Raw Data</a></p>
<p>To reduce possible bias, only the responses from advertisements and referrals were included in the Infographics (which is about 7,000 respondents), while this shared dataset includes all the 19,000+ responses collected from both internal and external channels.</p>
<p>Please keep in mind that your figures might be different from what we have in the report as we applied weighting to our data. For more information check the <a href="https://www.jetbrains.com/lp/devecosystem-2019/demographics/#methodology" rel="noopener noreferrer">Methodology</a> section.</p>
<p>The data are anonymized, with no personal information or geolocation details. Moreover, to prevent the identification of any individual respondents by their verbatim comments, all open-ended fields are omitted. We have also merged any answer options that collected fewer than 15 responses into the “Other” answer option.&nbsp;<a href="https://drive.google.com/file/d/1MsftN3BXhZKE2JzGTQZvs_GRNuaaw0Xn/view?usp=sharing" rel="noopener noreferrer">Via the link</a>, you can find the survey questions and survey logic as well.</p>
<p>If you have any questions regarding the survey or data please contact us at surveys.jetbrains.com.</p>
<p>Don’t miss the chance to participate in Developer Ecosystem Survey 2020 or other survey studies by JetBrains – <a href="https://www.jetbrains.com/lp/devecosystem-2019/#panel" rel="noopener noreferrer">join the JetBrains Survey Panel today</a>.</p>
', null, null, 'https://blog.jetbrains.com/blog/2019/08/13/developer-ecosystem-survey-2019-raw-data-available/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (40, 3, 'https://blog.jetbrains.com/blog/2019/08/15/8-steps-to-a-successful-user-group/', '8 Steps to a Successful User Group', '2019-08-15T13:00:51+00:00', 'Starting up a user group is not easy. But doing stuff you enjoy with peers who share your passion, keeping your knowledge and skills sharp and up to date by learning new things, and meeting other people in your profession, … Continue reading →', '<p>Starting up a user group is not easy. But doing stuff you enjoy with peers who share your passion, keeping your knowledge and skills sharp and up to date by learning new things, and meeting other people in your profession, makes it all totally worth it.</p>
<p>At JetBrains, we are a team of determined developers and enthusiasts; code is our passion. Creating great tools is not possible without inspiration, teamwork, feedback, and attention to detail. Building a user group requires a lot of the same qualities.</p>
<p>Among us, we have many keen and experienced user group organizers. In this article, we want to share with you their tips and tricks for creating a successful user group.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/qvJKBbh1WNo.jpg" alt="Community Speakers" width="2560" height="1707"></p>
<p><span></span></p>
<h3><strong>Find co-organizers</strong></h3>
<p>Running a user group is usually much more work than you first expect. Finding co-organizers who share your dreams and duties and can provide you with support and feedback, is key to getting your user group off the ground. You’ll be spending a lot of time together – brainstorming, programming, running events – so your team should be made up of people who you can get along with.</p>
<p><em>“It can be a time sink, and you NEED other people to help. You might be sick or have a vacation planned; someone needs to still run the group” (Rachel Appel, a former organizer of .NET Valley)</em></p>
<h3><strong>Look for sponsors</strong></h3>
<p>Your user group could be independent or company-run. In any case, you’re going to need sponsors to cover the expenses for things like the location, speakers, prizes, and everything else.</p>
<p>For company-based user groups, it’s easier to find sponsorship, location, and promotion. You can send invitations through the company’s mailing list to inform more potential attendees, invite speakers, and advertise the meetup on the company website. It’s beneficial for a company to host the user group meetups too, as it can help them support their brand in the local market.</p>
<p><em>“One thing that worked out very well for us was to start searching for sponsors early on. It gives a bit of a cushion to help out with organizing things; we have once used some sponsor money to throw a BBQ at one of the meetups, … it helps us, and helps the sponsors with visibility, definitely a good thing to do!” (Maarten Balliauw, Azure User Group Belgium)</em></p>
<h3><strong>Choose a location</strong></h3>
<p>Any place with a projector or a big screen that is easily accessible and quiet enough for presentations to be heard would work. Free wi-fi would also be a bonus.</p>
<p><em>“Cost is a huge factor. Another is access to the location. Finding places near metro stations or where you don’t need to drive an hour out of town is key” (Rachel Appel, a former organizer of .NET Valley)</em></p>
<p>Still, the most popular solution is a company office or a dedicated event space. If a user group has sponsors, they are likely to host the meetups at their place.</p>
<p><em>“When we have a speaker, we reach out to one or two of the sponsors to see if they have a room available in their company to host 30-40 people, and if they have: that’s our location” (Maarten Balliauw, Azure User Group Belgium)</em></p>
<p>Are you looking for a place that is a little less formal to host your event? Try your favorite pub or coworking space. Organizing a summer party is an excellent opportunity to change up the format and discuss topics in a more relaxed atmosphere.</p>
<h3><strong>Invite speakers</strong></h3>
<p>You can look for speakers in your local community, through professional connections, at conferences, or at other user group meetups. If a potential speaker plans to visit your city – contact them in advance and invite them to give a talk at your event.</p>
<p><em>“You can always reach out to people you don’t know through social networks, and they are usually very happy to come and speak at events – if their costs are covered” (Rachel Appel, a former organizer of .NET Valley)</em></p>
<p>Take note of all the people who have shown interest in or want to speak at your user group. Keep a list of potential speakers and topics, and reach out to those people when organizing your next event.</p>
<p>A speaker doesn’t need to be well-known or have thousands of followers on Twitter. Right now there could be someone in your user group who is involved in an exciting project, working on a cutting-edge topic, or wishing to share their insight and experience on solving challenging issues.</p>
<p><em>“I encourage new people to try and make a talk for the first time. Every meetup I engage people to contact me and share their ideas. Often it is these ideas that get made into a talk a few months later. Every good speaker was a newbie at some point, and user groups can help you grow in that direction. So my goal is not only to invite good speakers but to help people become one” (Anastasia Kazakova, St.Petersburg C++ User Group)</em></p>
<p>However, don’t get frustrated if you cannot find a speaker or if they cancel their talk at the last minute:</p>
<p><em>“Not every meetup needs a speaker. Hack sessions and discussion rounds can also be successful formats” (Justin Kaeser, Munich Scala User Group)</em></p>
<h3><strong>Stick to the plan</strong></h3>
<p>When you have an organizational team and a potential location – book a date in your calendar and don’t back out. This helps fight procrastination and the quest for perfection.</p>
<p><em>“Find 1-2 other people to spread the workload – but also make sure your goals align. Find and talk to other user group leaders – not necessarily in the same technology/field – and ask them for help. Fight for regular events – it’s what keeps your group alive” (Yann Cebron, JUG Hannover)</em></p>
<p><em>“Just do it! I wanted to start a user group for a long time, but I didn’t feel I could do it. Sometimes I struggle with fewer people willing to give a talk; sometimes I have to struggle with other things. But I know and love the community, and I feel it is all worth it”. (Anastasia Kazakova, St.Petersburg C++ User Group)</em></p>
<h3><strong>Keep it regular</strong></h3>
<p>Regular meetups work much better for promoting your user group and bring you more members. An event doesn’t need to be ideal; even just a few people will give you some experience and inspiration for the future.</p>
<p><em>“I try to be ready with the next event announcement before the previous event so that I can invite people in person to the next meetup. I usually include the announcement on the next meetup in my intro presentation at the beginning of each event.” (Anastasia Kazakova, St.Petersburg C++ User Group)</em></p>
<p>It’s a good idea to have a fixed day for your meetups (e.g., the first Thursday of every month). If there are established user groups in your area – make sure your events don’t run across. Social media and word of mouth can help attract more people to your events.</p>
<p><em>“Twitter and our newsletter are our main drivers. LinkedIn and Facebook come second.” (Maarten Balliauw, Azure User Group Belgium)</em></p>
<p>Use all the possible communication channels available to you. You cannot overpromote an event. Even established user groups can have a poor turnout from time to time. Don’t be afraid – just keep going.</p>
<p><em>“I just announce out events on meetup.com and sometimes tweet from my own twitter account (which is now about 1300 followers) and then get a list of RSVPs and a waiting list. However, our regular drop-off rate is 40-50%. Which is totally fine.” (Anastasia Kazakova, St.Petersburg C++ User Group)</em></p>
<h3><strong>Talk to your attendees</strong></h3>
<p>Involve the community: ask them to tell you what interests them and who they want to meet. Some user groups prefer an interactive format for the initial meetup. They provide questions and let the attendees discuss. This helps the organizers determine the interests and expectations of the user group members. If you make a list – you are likely to get a schedule for your next events.</p>
<p><em>“We used to have a Google Form to gather feedback after each event, but stopped doing that after we realized not everyone was using it and it was not representative. Now we try to chat with people to hear what they thought of the meetup/speaker” (Maarten Balliauw, Azure User Group Belgium)</em></p>
<p>If there are a lot of questions after a talk, you may want to suggest continuing in the nearest cafe or pub.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/3F5A6757.jpg" alt="JetBrains Community" width="3000" height="2000"></p>
<h3><strong>Get prizes for your user group members</strong></h3>
<p>Stickers, notebooks, t-shirts, software licenses all make great giveaways and prizes for attendees. They are not a necessity, but they are a nice bonus that can become a good tradition to support your community and gauge the interest of your events.</p>
<p>JetBrains provides <a href="https://www.jetbrains.com/community/support/#section=communities" rel="noopener noreferrer">active developer user groups</a>&nbsp;with free licenses for our professional tools to raffle off at your group’s regular local events. We have effective solutions <a href="https://www.jetbrains.com/products.html?fromMenu#type=ide" rel="noopener noreferrer">for all popular technologies and languages</a>: IntelliJ IDEA for Java, ReSharper for .NET, PhpStorm for PHP, PyCharm for Python, and many others.</p>
<p>We value your dedication to the community and so provide the user group organizers with free annual subscriptions as well.</p>
<p><a href="https://www.jetbrains.com/shop/eform/community/" rel="noopener noreferrer">Submit an online form</a> to get support for your user group now or drop us an email at <a href="mailto:community-support@jetbrains.com" rel="noopener noreferrer">community-support@jetbrains.com</a> if you have any questions and let’s rock <img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-includes/images/smilies/simple-smile.png" alt=":)"></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/08/15/8-steps-to-a-successful-user-group/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (41, 3, 'https://blog.jetbrains.com/blog/2019/08/20/jetbrains-toolbox-2019-2/', 'JetBrains Toolbox 2019.2', '2019-08-20T13:43:20+00:00', 'We are happy to say that all of the JetBrains desktop tools have been given a huge overhaul! Look through the major IDEs and .NET tools news and update to the newest versions to start enjoying the brand new features … Continue reading →', '<p>We are happy to say that all of the JetBrains desktop tools have been given a huge overhaul!</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/Toolbox_19_2_800x155@2x.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/Toolbox_19_2_800x155@2x.png" alt="JetBrains Toolbox 2019.2" width="1600" height="310"></a></p>
<p>Look through the major IDEs and .NET tools news and update to the newest versions to start enjoying the brand new features and enhancements.</p>
<div><a href="https://www.jetbrains.com/idea/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/logo.png" alt="IntelliJ IDEA" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/idea/whatsnew/" rel="noopener noreferrer"><strong>IntelliJ IDEA 2019.2</strong></a> supports Java 13 preview features, integrates Profiling Tools, and introduces a new single place to view all services – the Services tool window. It also lets you manage all code styles per scope via an EditorConfig file, supports the native Git ignore files handling out of the box, and improves its support for Build tools.</div>
</div>
<div><a href="https://www.jetbrains.com/rider/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/logo-7.png" alt="Rider" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/rider/whatsnew/" rel="noopener noreferrer"><strong>Rider 2019.2</strong></a> adds new goodies to the debugger and improves support for Xamarin iOS development. The UI is now clearer, friendlier, and more consistent. This release also brings Code Vision to F#, code coverage for Mono, and finally supports third-party and 32-bit controls in the Windows Forms designer.</div>
</div>
<p><span></span></p>
<div><a href="https://www.jetbrains.com/clion/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/icon_CLion.png" alt="CLion" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/clion/whatsnew/" rel="noopener noreferrer"><strong>CLion 2019.2</strong></a> provides more assistance for Embedded developers and improves the debugging abilities in several areas, including an experimental debugger for the Microsoft Visual C++ toolchain. The editor introduces Parameter Name hints and improves code analysis by bringing back and updating the ‘Unused Includes’ check. This all is accompanied by improved IDE performance and several huge changes from the IntelliJ Platform.</div>
</div>
<div><a href="https://blog.jetbrains.com/blog/2019/08/20/jetbrains-toolbox-2019-2/www.jetbrains.com/go/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/logo-1.png" alt="GoLand" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/go/whatsnew/" rel="noopener noreferrer"><strong>GoLand 2019.2</strong></a> boosts the debugger with function calls support, adds variety to the Default &amp; Darcula color schemes, offers customizable Postfix Completion templates, and makes Go Modules and dep integration smarter. You will also find various quick-fixes based on the Change Signature refactoring and many other new code editing features. Support for Shell scripts and Kustomize for Kubernetes is available, as is support for the new Go 1.13 features.</div>
</div>
<div><a href="https://www.jetbrains.com/pycharm/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/logo-2.png" alt="PyCharm" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/pycharm/whatsnew/" rel="noopener noreferrer"><strong>PyCharm 2019.2</strong></a>brings an even better Jupyter notebook experience: run all your cells with a single click, more granular server configuration, and more. We’ve also implemented initial support for Python 3.8, copy-pasting a cURL format request into .http files, and now highlight the syntax of over 20 popular languages out of the box.</div>
</div>
<div><a href="https://www.jetbrains.com/webstorm/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/logo-3.png" alt="WebStorm" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/webstorm/whatsnew/" rel="noopener noreferrer"><strong>WebStorm 2019.2</strong></a> brings with it major enhancements in code completion for JavaScript and TypeScript, improved support for Vue.js, syntax highlighting for 20+ languages, new intentions for destructuring, and more.</div>
</div>
<div><a href="https://www.jetbrains.com/phpstorm/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/phpstorm.png" alt="PhpStorm" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/phpstorm/whatsnew/" rel="noopener noreferrer"><strong>PhpStorm 2019.2</strong></a> is a major update for the PHP IDE. Explore the new features: support for PHP 7.4 Typed properties, .phpt test files support, RegExps in PHP highlighting and check, finding duplicated code on the fly, syntax highlighting for Go, Ruby, Python, and many other languages, EditorConfig support, and lots more.</div>
</div>
<div><a href="https://www.jetbrains.com/resharper/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/logo-4.png" alt="ReSharper" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/resharper/whatsnew/" rel="noopener noreferrer"><strong>ReSharper Ultimate 2019.2</strong></a> delivers better support for C# 8.0 and updates in Navigation, Find Usages, and debugger data tips. It improves startup times and offers initial support for the “Per-Monitor DPI Awareness” mode in VS 2019. Indexing for C++ projects is faster, and more C++ 20 features are supported.</div>
</div>
<div><a href="https://www.jetbrains.com/resharper-cpp/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/logo-5.png" alt="ReSharperC++" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/resharper-cpp/whatsnew/" rel="noopener noreferrer"><strong>ReSharper C++ 2019.2</strong></a> provides significantly faster indexing thanks to a new preprocessor implementation. It improves code navigation and completion actions, adds more code hints in the editor, and has new code inspections. This version also comes with more sophisticated support for the new C++20 standard, as well as better integration for Unreal Engine 4 projects.</div>
</div>
<div><a href="https://www.jetbrains.com/datagrip/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/logo-6.png" alt="DataGrip" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/datagrip/whatsnew/" rel="noopener noreferrer"><strong>DataGrip 2019.2</strong></a> comes with a set of new features: Services tool window allows you to manage all connections and follow the query time. Full-text search helps you to find any data anywhere. Filtering in navigation makes searching for objects faster.</div>
</div>
<div><a href="https://www.jetbrains.com/objc/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/icon_AppCode.png" alt="icon_AppCode" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/objc/whatsnew/" rel="noopener noreferrer"><strong>AppCode 2019.2</strong></a> is here with initial Swift 5.1 support, Code Coverage for unit tests, LLDB Disassembly view, Find Usages sorting, Create from Usage for enum cases, and an ability to Build, Run, Debug, and Test during indexing.</div>
</div>
<div><a href="https://www.jetbrains.com/ruby/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/logo-8.png" alt="RubyMine" width="64" height="64"></a>
<div><a href="https://www.jetbrains.com/ruby/whatsnew/" rel="noopener noreferrer"><strong>RubyMine 2019.2</strong></a> adds support for Rails 6 and Ruby 2.7. It makes the debugger faster and adds Smart Step Into to help you investigate every method located on the same line. Proper code insight for shell scripts and improvements for Factory Bot, YARD, JavaScript, Git, and database tools are also included.</div>
</div>
<p>Updates for the following products are ready for you to install and start using. The easiest way to do so is through the <a href="https://www.jetbrains.com/toolbox/app/" rel="noopener noreferrer"><strong>Toolbox App</strong></a>. It will help you keep track of all your tools and the updates available for them, and it’s free.</p>
<p><a title="Download now!" href="https://www.jetbrains.com/toolbox/app/" rel="noopener noreferrer">Download Toolbox App</a></p>
<p>With these releases out, we’ve already started working on further improvements, so early access programs for 2019.3 should open very soon. Stay tuned!</p>
<p><em>Your JetBrains team<br>
The Drive to Develop</em></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/08/20/jetbrains-toolbox-2019-2/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (42, 3, 'https://blog.jetbrains.com/blog/2019/08/21/online-learning-how-one-developer-went-from-beginner-to-pro/', 'Online Learning: How One Developer Went from Beginner to Pro', '2019-08-21T15:56:45+00:00', 'People get into programming in different ways. Some begin learning it in school, some go to university to study Computer Science, while others get started with online courses – like Zina Smirnova, now a member of the Educational Products development … Continue reading →', '<p><em>People get into programming in different ways. Some begin learning it in school, some go to university to study Computer Science, while others get started with online courses – like Zina Smirnova, now a member of the Educational Products development team at JetBrains. We talked with Zina to find out more about her professional path.</em></p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/Zina_Smirnova.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/08/Zina_Smirnova.png" alt="Zina Smirnova" width="2551" height="1702"></a></p>
<p><b>Can you tell us about your background and how you decided to become a developer?</b></p>
<p>It didn’t happen overnight, but like all worthy things in life, it took a lot of time and effort. It all began when I was on maternity leave as a junior researcher at the Institute of Precambrian Geology and Geochronology of the Russian Academy of Sciences.<br>
<span></span></p>
<p>Having a baby changes one’s life in a lot of ways. Personally for me, it became abundantly clear that life is short and I should spend mine doing something that matters, in addition to parenting of course. I have always wanted to code. In fact, I had been admitted to both the Mathematics &amp; Mechanics and Chemistry departments, but had ended up choosing chemistry – I’m still not sure why. Continuing in the chemistry track seemed to make sense, especially after 5 years of undergrad study + a few years of postgrad on top of that. I told myself it was too late to switch gears, the train had left the station, and so on.</p>
<p>Then my maternity leave happened, and I found myself in a seemingly never-ending routine… It reminded me of Groundhog Day in some ways. But, it made me realize I needed to keep my brain additionally occupied. I thought, why not give programming a shot? I mean I was staying at home all day anyway. I went on Stepik.org and took their Python courses. When I completed those, I knew I would become a developer, no matter how long it might take me. It was my calling. Oh, and I wasn’t aware back then that JetBrains had an EduTools plugin that integrates with Stepik and lets you complete courses right in JetBrains IDEs — if I’d known that, I would have saved lots of time and effort.</p>
<p><b>Interesting! What happened next?</b></p>
<p>After the Python courses, it was a turning point for me because I wasn’t sure what to do next. A friend then advised me to switch to Java.</p>
<p>Half a year later, I found an internship at <a href="http://javaops.ru/" rel="noopener noreferrer">Top Java</a>, a Russian-language training course for developers aspiring to code in Java. The course guides you through building a fully functional Spring/JPA Enterprise application, complete with authentication and access management, and based on the technology stack including Spring, Hibernate, PostgreSQL, Bootstrap, JS, etc. From my first attempt at the course, I absorbed only about half – there was a lot to learn, and the pace was quite fast. You had to read a lot, think, and figure things out on your own. But in my opinion, that’s the great thing about it, because from day one, you get used to finding information on your own and using Google as your best friend that knows everything. My payment plan covered code review, and that was just awesome. I believe code review is the key to growing as a developer. In my team today, 100% of code gets reviewed.</p>
<p><b>Were those skills enough to let you pass developer job interviews?</b></p>
<p>My final project as an intern helped me win another internship, which was also very interesting and useful. After the second internship, I began preparing for interviews intensely and kept learning a lot. I passed my first test interview via Skype and then started sending out CVs. To be honest, interviews weren’t the biggest hurdle for me. I received an offer after my very first interview, without even a test assignment. The next day, the Educational Products team at JetBrains invited me for an interview, too.</p>
<p><b>How did that interview go?</b></p>
<p>I loved the initial interview: the questions were great, I could sense right away that everyone was passionate about their work, and things looked friendly and fun. I went home excited, but not daring to hope. Imagine my surprise when in a couple days I received a test assignment! By that point I had already accepted the first offer I got, and it almost seemed wrong to backtrack on it – I had no idea how the JetBrains thing would turn out. I managed to get a two-week extension for my start date at the first place, and used that time to complete the test assignment for JetBrains. Then I began working at the first place (I actually liked it there; it was about web, Spring, and Hibernate), and spent a week there. During that time I passed the final interview at JetBrains and finally got the job I have now.</p>
<p><b>How do you feel about working as a developer on the Educational Products team?</b></p>
<p>Right now I’m a junior developer with Educational Products and I’m happy. Not only am I doing what I love, but my work is very meaningful. Our plugin, EduTools, helps people much like me: those who are learning programming from scratch, turning their lives around by completing courses in various programming languages in JetBrains IDEs, and eventually launching their career in software development. My own experience shows that it’s never too late to pursue your dream job, even if you’re a new mom on maternity leave.</p>
<p><b>Thanks a lot for sharing your story, Zina! Good luck in your future endeavors!</b></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/08/21/online-learning-how-one-developer-went-from-beginner-to-pro/#comments');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (43, 3, 'https://blog.jetbrains.com/blog/2019/09/03/changes-to-startup-discount-program/', 'Changes to Startup Discount Program', '2019-09-03T11:54:22+00:00', 'If your startup is engaged in the development of a software-based product or service and you are looking for professional tools to take it to the next level, we have a special offer for you. Get a 50% discount on … Continue reading →', '<p><em>If your startup is engaged in the development of a software-based product or service and you are looking for professional tools to take it to the next level, we have a special offer for you. Get a <strong>50% discount on all of our products</strong> including IntelliJ IDEA, CLion, DataGrip, PhpStorm, PyCharm, Rider, WebStorm, ReSharper, ТeamCity, YouTrack and others!</em></p>
<p>Today, we are happy to announce some changes that expand <a href="https://www.jetbrains.com/shop/eform/startup" rel="noopener noreferrer"><strong>JetBrains Startup Discount Program</strong></a> eligibility and increase the duration of the discounted subscriptions. We now support companies who have been <strong>in business for up to 5 years</strong>. After your application is approved, your 50% startup discount will allow you to purchase multiple products and subscriptions for up to 10 unique users <strong>over a period of 60 months</strong>.</p>
<p><a href="https://www.jetbrains.com/shop/eform/startup" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/1200x627-1.png" alt="JetBrains Startup Discount - 50% OFF" width="1200" height="627"></a></p>
<p>Since we first announced JetBrains Startup Discount Program in February 2014, <strong>more than 20,000 startups</strong> have already taken advantage of our special offer. For IntelliJ IDEA developers this means that they could have <a href="https://www.jetbrains.com/lp/idea-forrester-tei/" rel="noopener noreferrer"><strong>saved 270 hours per user, per year</strong></a> for development, debugging and maintenance. Join companies in the United States, Germany, Israel, Poland, South Korea, and 110 other countries who already take part in JetBrains Startup Discount Program. <a href="https://www.jetbrains.com/shop/eform/startup" rel="noopener noreferrer"><strong>Learn more and apply today</strong></a>!</p>
', null, null, 'https://blog.jetbrains.com/blog/2019/09/03/changes-to-startup-discount-program/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (44, 3, 'https://blog.jetbrains.com/blog/2019/09/06/welcome-edutools-plugin-v2-9/', 'Welcome EduTools Plugin v2.9: Code Insight Improvements for YAML Configs, New Course Creator Features, and More', '2019-09-06T15:39:54+00:00', 'We’ve just updated our plugin to v2.9 to help you learn and teach different programming languages with more ease! Benefit from the latest code insight improvements for YAML configs, configure placeholder dependencies on placeholder creation, enjoy fewer bugs, and use … Continue reading →', '<p>We’ve just updated our plugin to v2.9 to help you learn and teach different programming languages with more ease! Benefit from the latest code insight improvements for YAML configs, configure placeholder dependencies on placeholder creation, enjoy fewer bugs, and use the 2019.2.1 IDE builds for PyCharm Edu and IntelliJ IDEA Edu.</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/EduTools29.jpg" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/EduTools29.jpg" alt="EduTools2.9" width="1500" height="800"></a></p>
<h2>For Educators</h2>
<h3>Improved support for YAML configs</h3>
<p>With EduTools plugin version 2.7, we completely reworked our solution for storing course configuration files: all the information about your course is conveniently stored in YAML format. Now, we’ve made some more improvements to give you a better experience when using this functionality:</p>
<ul>
<li>Non-existent elements (such as files and lessons) are highlighted as errors and can be created right from their usages.</li>
</ul>
<p><span></span></p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/2019-09-03_17-46-47.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/2019-09-03_17-46-47.png" alt="2019-09-03_17-46-47" width="923" height="459"><br>
</a></p>
<ul>
<li>Navigate to a selected element from its usage.</li>
</ul>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/2019-09-03_17-05-04.gif" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/2019-09-03_17-05-04.gif" alt="2019-09-03_17-05-04" width="924" height="459"></a></p>
<ul>
<li>Completion shows available files, lessons, and so on in the corresponding places in config files.</li>
</ul>
<ul>
<li>Rename refactorings can be called up from YAML config files and the Project Tree.</li>
</ul>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/2019-09-03_17-07-30.gif" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/2019-09-03_17-07-30.gif" alt="2019-09-03_17-07-30" width="924" height="459"></a></p>
<h3>New course creator features</h3>
<p>Now you can configure placeholder dependencies when the placeholder is created:</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/2019-09-03_18-11-24.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/2019-09-03_18-11-24.png" alt="2019-09-03_18-11-24" width="923" height="459"></a></p>
<p>We’ve also added a variable,&nbsp;<strong>%IDE_NAME%</strong>, which is automatically replaced with the name of the corresponding IDE in the task description window.</p>
<p><span><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/2019-09-03_19-28-31.gif" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/09/2019-09-03_19-28-31.gif" alt="2019-09-03_19-28-31" width="924" height="458"></a><br>
</span></p>
<h2>For Learners</h2>
<h3>Hyperskill bug fixes</h3>
<p>We’ve implemented a number of bug fixes related to&nbsp;<a href="https://hi.hyperskill.org/" rel="noopener noreferrer">Hyperskill</a> – a project-based Java learning platform and the first member of <a href="https://www.jetbrains.com/academy/" rel="noopener noreferrer">JetBrains Academy</a>. Hyperskill integration has become even better, so go ahead and try it if you haven’t yet!</p>
<h2>IntelliJ IDEA Edu and PyCharm Edu 2019.2.1</h2>
<p>Please welcome the IDE builds for PyCharm Edu 2019.2.1 and IntelliJ IDEA Edu 2019.2.1 (IntelliJ IDEA Community Edition with the <a href="https://plugins.jetbrains.com/plugin/10081-edutools" rel="noopener noreferrer">EduTools plugin</a>). They combine the latest fixes&nbsp;for Pycharm and IntelliJ IDEA and the latest plugin updates in v2.9.</p>
<p><a title="Download Educational IDEs" href="https://www.jetbrains.com/education/download/" rel="noopener noreferrer"><i></i>CHOOSE YOUR EDU IDE</a></p>
<p><em>Your Educational Products Team</em></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/09/06/welcome-edutools-plugin-v2-9/#comments');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (45, 3, 'https://blog.jetbrains.com/blog/2019/09/26/jetbrains-security-bulletin-q2-2019/', 'JetBrains Security Bulletin Q2 2019', '2019-09-26T14:37:16+00:00', 'This bulletin summarizes the security vulnerabilities detected in JetBrains products and remediated in the second quarter of 2019. Here’s a summary report that comprises the affected product, the description of each issue, its severity, and the product version containing the … Continue reading →', '<p>This bulletin summarizes the security vulnerabilities detected in JetBrains products and remediated in the second quarter of 2019.</p>
<p>Here’s a summary report that comprises the affected product, the description of each issue, its severity, and the product version containing the fix.</p>
<p><span></span></p>
<table>
<tbody>
<tr>
<td><strong>Product</strong></td>
<td><strong>Description</strong></td>
<td><strong>Severity</strong></td>
<td><strong>Resolved in</strong></td>
<td><strong>CVE/CWE</strong></td>
</tr>
<tr>
<td>Exception Analyzer</td>
<td>Insecure transfer of JetBrains Account credentials. (<span>EXA-652</span>)</td>
<td>Critical</td>
<td><span>Not applicable</span></td>
<td><a href="https://cwe.mitre.org/data/definitions/598.html" rel="noopener noreferrer">CWE-598</a></td>
</tr>
<tr>
<td>Hub</td>
<td>No way to set a password to expire automatically. (JPS-8816)</td>
<td>Low</td>
<td>2018.4.11436</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-14955" rel="noopener noreferrer">CVE-2019-14955</a></td>
</tr>
<tr>
<td>IntelliJ IDEA</td>
<td>Resolving artifacts using an http connection, potentially allowing an MITM attack. (IDEA-211231)</td>
<td>High</td>
<td>2019.2</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-14954" rel="noopener noreferrer">CVE-2019-14954</a></td>
</tr>
<tr>
<td>JetBrains Account</td>
<td>Authorized account enumeration. (JPF-9370)</td>
<td>Low</td>
<td>2019.5</td>
<td><a href="https://cwe.mitre.org/data/definitions/204.html" rel="noopener noreferrer">CWE-204</a></td>
</tr>
<tr>
<td>JetBrains Account</td>
<td><span>Cross-origin resource sharing misconfiguration (Reported by Vishnu Vardhan). </span> (JPF-9095)</td>
<td>Low</td>
<td><span>2019.5</span></td>
<td><a href="https://cwe.mitre.org/data/definitions/942.html" rel="noopener noreferrer">CWE-942</a></td>
</tr>
<tr>
<td>JetBrains Account</td>
<td>No rate limitation on the account details page. (JPF-9704)</td>
<td>Moderate</td>
<td>2019.8</td>
<td><a href="https://cwe.mitre.org/data/definitions/770.html" rel="noopener noreferrer">CWE-770</a></td>
</tr>
<tr>
<td><span>JetBrains Account</span></td>
<td>No rate limitation on the licenses page. (JPF-9713)</td>
<td>High</td>
<td>2019.9</td>
<td><a href="https://cwe.mitre.org/data/definitions/770.html" rel="noopener noreferrer">CWE-770</a></td>
</tr>
<tr>
<td><span>JetBrains Account</span></td>
<td>Unauthorized disclosure of license email on the licenses page. (JPF-9692)</td>
<td>Critical</td>
<td>2019.8</td>
<td><a href="https://cwe.mitre.org/data/definitions/284.html" rel="noopener noreferrer">CWE-284</a></td>
</tr>
<tr>
<td>JetBrains Website</td>
<td>Reflected XSS. (JS-9853)</td>
<td>Moderate</td>
<td>Not Applicable</td>
<td><a href="https://cwe.mitre.org/data/definitions/79.html" rel="noopener noreferrer">CWE-79</a></td>
</tr>
<tr>
<td>Kotlin Ktor</td>
<td>Command injection through LDAP username.</td>
<td>Moderate</td>
<td>1.2.0-rc, 1.2.0</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-12736" rel="noopener noreferrer">CVE-2019-12736</a></td>
</tr>
<tr>
<td>Kotlin Ktor</td>
<td>Predictable Salt for user credentials.</td>
<td>Moderate</td>
<td>1.2.0-rc2, 1.2.0</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-12737" rel="noopener noreferrer">CVE-2019-12737</a></td>
</tr>
<tr>
<td>PyCharm</td>
<td>Remote call causing an “out of memory” error was possible. (PY-35251)</td>
<td>Low</td>
<td>2019.2</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-14958" rel="noopener noreferrer">CVE-2019-14958</a></td>
</tr>
<tr>
<td>Rider</td>
<td>Unsigned DLL was used in a distributive. (RIDER-27708)</td>
<td>Moderate</td>
<td>2019.1.2</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-14960" rel="noopener noreferrer">CVE-2019-14960</a></td>
</tr>
<tr>
<td>ReSharper</td>
<td>DLL hijacking vulnerability. (RSRP-473674)</td>
<td>High</td>
<td>2019.2</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-16407" rel="noopener noreferrer">CVE-2019-16407</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>Previously used unencrypted passwords were suggested by a web browser’s auto-completion. (TW-59759)</td>
<td>Low</td>
<td>2019.1</td>
<td><a href="https://cwe.mitre.org/data/definitions/200.html" rel="noopener noreferrer">CWE-200</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>VMWare plugin did not check SSL certificate. (TW-59562)</td>
<td>Moderate</td>
<td>2019.1</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-15042" rel="noopener noreferrer">CVE-2019-15042</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>Remote Code Execution on the server with certain network configurations. (TW-60430)</td>
<td>Moderate</td>
<td>2019.1</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-15039" rel="noopener noreferrer">CVE-2019-15039</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>Project administrator could get unauthorized access to server-level data. (TW-60220)</td>
<td>High</td>
<td>2019.1</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-15035" rel="noopener noreferrer">CVE-2019-15035</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>Project administrator could execute any command on the server machine. (TW-60219)</td>
<td>High</td>
<td>2019.1</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-15036" rel="noopener noreferrer">CVE-2019-15036</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>Security has been tightened thanks to using additional HTTP headers. (TW-59034)</td>
<td>High</td>
<td>2019.1</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-15038" rel="noopener noreferrer">CVE-2019-15038</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>Possible XSS vulnerabilities on the settings pages. (TW-59870, TW-59852, TW-59817, TW-59838, TW-59816)</td>
<td>High</td>
<td>2019.1</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-15037" rel="noopener noreferrer">CVE-2019-15037</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>XSS vulnerability. (TW-61242, TW-61315)</td>
<td>High</td>
<td>2019.1.2</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-15848" rel="noopener noreferrer">CVE-2019-15848</a></td>
</tr>
<tr>
<td>Toolbox App</td>
<td>Unencrypted connection to external resources, potentially allowed an MITM attack. (TBX-3327, ADM-30275)</td>
<td>Low</td>
<td>1.15.5605</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-14959" rel="noopener noreferrer">CVE-2019-14959</a>, <a href="https://cwe.mitre.org/data/definitions/311.html" rel="noopener noreferrer">CWE-311</a></td>
</tr>
<tr>
<td>Upsource</td>
<td>Insufficient escaping of code blocks. (UP-10387)</td>
<td>Moderate</td>
<td>2019.1.1412</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-14961" rel="noopener noreferrer">CVE-2019-14961</a></td>
</tr>
<tr>
<td>Upsource</td>
<td>Credentials exposure via RPC command. (UP-10344)</td>
<td>Critical</td>
<td>2018.2.1290</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-12156" rel="noopener noreferrer">CVE-2019-12156</a></td>
</tr>
<tr>
<td>Upsource</td>
<td>Credentials exposure via RPC command. (UP-10343)</td>
<td>Critical</td>
<td>2018.2.1293</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-12157" rel="noopener noreferrer">CVE-2019-12157</a></td>
</tr>
<tr>
<td>Vim Plugin</td>
<td>Project data appeared in user level settings. (VIM-1184)</td>
<td>Moderate</td>
<td>0.52</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-14957" rel="noopener noreferrer">CVE-2019-14957</a></td>
</tr>
<tr>
<td>YouTrack</td>
<td>A user could get a list of project names under certain conditions. (JT-53162)</td>
<td>Low</td>
<td>2019.2.53938</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-14956" rel="noopener noreferrer">CVE-2019-14956</a></td>
</tr>
<tr>
<td>YouTrack</td>
<td>Stored XSS on the issue page. (JT-51077, JT-54121)</td>
<td>High</td>
<td>2019.2.53938, 2019.2.57829</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-14953" rel="noopener noreferrer">CVE-2019-14953</a>, <a href="https://nvd.nist.gov/vuln/detail/CVE-2019-16171" rel="noopener noreferrer">CVE-2019-16171</a></td>
</tr>
<tr>
<td>YouTrack</td>
<td>Stored XSS in the issues list. (JT-52894)</td>
<td>High</td>
<td>2019.1.52584</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-14952" rel="noopener noreferrer">CVE-2019-14952</a></td>
</tr>
<tr>
<td>YouTrack</td>
<td>A compromised URL was automatically whitelisted by YouTrack. (JT-47653)</td>
<td>Low</td>
<td>2019.1.52545</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-15041" rel="noopener noreferrer">CVE-2019-15041</a></td>
</tr>
<tr>
<td>YouTrack</td>
<td>Cross-Site Request Forgery. (JT-30098)</td>
<td>Low</td>
<td>2019.1</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-15040" rel="noopener noreferrer">CVE-2019-15040</a></td>
</tr>
</tbody>
</table>
<p>If you need any further assistance, please contact our&nbsp;<a href="mailto:security@jetbrains.com" rel="noopener noreferrer">Security Team</a>.</p>
<p><a href="https://www.jetbrains.com/security/subscribe" rel="noopener noreferrer">Subscribe</a>&nbsp;to receive the bulletin in your mailbox.</p>
<p><em>Your JetBrains Team<br>
The Drive to Develop</em></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/09/26/jetbrains-security-bulletin-q2-2019/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (46, 3, 'https://blog.jetbrains.com/blog/2019/10/17/edutools-plugin-v3-0/', 'EduTools Plugin v3.0: C/C++ Support and Better YAML Configs for Educators, and New Features for Stepik Learners', '2019-10-17T14:48:11+00:00', 'With the 2019.3 Early Access Program in full swing for IntelliJ IDEA, PyCharm, WebStorm, and CLion, we’ve just updated our plugin to v3.0&nbsp;for you to try all the new educational features with the new 2019.3 IDEs. INSTALL EDUTOOLS PLUGIN C/C++ … Continue reading →', '<p>With the 2019.3 Early Access Program in full swing for <a href="https://www.jetbrains.com/idea/nextversion/" rel="noopener noreferrer">IntelliJ IDEA</a>, <a href="https://www.jetbrains.com/pycharm/nextversion/" rel="noopener noreferrer">PyCharm</a>, <a href="https://www.jetbrains.com/webstorm/nextversion/" rel="noopener noreferrer">WebStorm</a>, and <a href="https://www.jetbrains.com/clion/nextversion/" rel="noopener noreferrer">CLion</a>, we’ve just updated our <a href="https://plugins.jetbrains.com/plugin/10081-edutools" rel="noopener noreferrer">plugin to v3.0</a>&nbsp;for you to try all the new educational features with the new 2019.3 IDEs.</p>
<p><a href="https://plugins.jetbrains.com/plugin/10081-edutools" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/800x400_blog.png" alt="EduTools Plugin v3.0" width="800" height="400"></a></p>
<p><a title="Install EduTools Plugin" href="https://www.jetbrains.com/help/education/install-edutools-plugin.html" rel="noopener noreferrer"><i></i>INSTALL EDUTOOLS PLUGIN</a></p>
<p><a href="https://blog.jetbrains.com/blog/2019/10/17/edutools-plugin-v3-0/#c_support" rel="noopener noreferrer">C/C++ Support for Educators</a><br>
<a href="https://blog.jetbrains.com/blog/2019/10/17/edutools-plugin-v3-0/#better_yaml" rel="noopener noreferrer">Better YAML Configs</a><br>
<a href="https://blog.jetbrains.com/blog/2019/10/17/edutools-plugin-v3-0/#insert_shortcuts" rel="noopener noreferrer">Insert Shortcut Action in Task Descriptions</a><br>
<a href="https://blog.jetbrains.com/blog/2019/10/17/edutools-plugin-v3-0/#video_lessons" rel="noopener noreferrer">Stepik Video Lessons</a><br>
<a href="https://blog.jetbrains.com/blog/2019/10/17/edutools-plugin-v3-0/#task_submissions" rel="noopener noreferrer">List of a Task Submissions</a><br>
<a href="https://blog.jetbrains.com/blog/2019/10/17/edutools-plugin-v3-0/#syntax_errors" rel="noopener noreferrer">More Detailed Output for Python Syntax Errors</a></p>
<p><span></span></p>
<h1>For Educators<img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/Teacher_Light_Active_360x360-04.png" alt="Educator" width="180" height="180"></h1>
<h2>C/C++ Support</h2>
<p>If you’re a C/C++ educator and want to create learning content with a focus on practice, CLion with the EduTools plugin is the tool for you. You can now create theory lessons along with practice assignments and add your own custom tests to automatically verify your learners’ progress:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/c_support.png" alt="c_support" width="1440" height="760"></p>
<p>Please follow this <a href="https://www.jetbrains.com/help/education/educator-start-guide.html?section=C%2B%2B" rel="noopener noreferrer">Educator Start Guide</a>&nbsp;to get going and don’t hesitate to ask our support any questions: here in the comments or via the <a href="mailto:academy@jetbrains.com" rel="noopener noreferrer">academy@jetbrains.com</a> email.</p>
<h2>Better YAML Configs</h2>
<p>Since version 2.7 of the EduTools plugin, we’ve been improving our solution for storing course configuration files in YAML format. This release supports one more configuration parameter: <em>solutions_hidden</em>. With this parameter you can decide whether to enable the <strong>Peek Solutions</strong> action in your course:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/solutions_hidden_1.png" alt="solutions_hidden_1" width="1440" height="752"></p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/solutions_hidden_2.png" alt="solutions_hidden_2" width="1440" height="948"></p>
<p>… or not:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/solutions_hidden_3.png" alt="solutions_hidden_3" width="1440" height="780"></p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/solutions_hidden_4.png" alt="solutions_hidden_4" width="1440" height="940"></p>
<p>All the configuration files can not only be found in Educator mode but also in Student mode via the <strong>Project View</strong> tool window. This can help you check your course configuration and solve issues a learner might face:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/course_configs_student.png" alt="course_configs_student" width="1440" height="580"></p>
<p>You can read about the previous YAML configuration improvements <a href="https://blog.jetbrains.com/blog/2019/09/06/welcome-edutools-plugin-v2-9/" rel="noopener noreferrer">here</a>, or take a look at all the <a href="https://www.jetbrains.com/help/education/meet-yaml-format.html" rel="noopener noreferrer">options</a>&nbsp;available.</p>
<h2>Insert Shortcut Action in Task Descriptions</h2>
<p>We believe teaching people how to use development tools is an important part of teaching programming languages and technologies. We also believe mastering shortcuts is one of the most productive skills a future developer can have. To help your learners build their confidence with this smoothly, you can now easily insert an IDE shortcut into a task description:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/insert_shortcuts.png" alt="Insert Shortcut" width="800"></p>
<h1>For Learners<img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/Learner_Light_Active_360x360-03.png" alt="Learner" width="180" height="180"></h1>
<h2>Stepik Video Lessons</h2>
<p>If you’re a <a href="https://stepik.org/" rel="noopener noreferrer">Stepik</a> learner, you can now enjoy video lessons from inside your IDE – giving you even less reason to switch back and forward from the Stepik website to your IDE! It may be convenient to <a href="https://www.jetbrains.com/help/idea/viewing-modes.html" rel="noopener noreferrer">adjust the Task Description tool window viewing mode</a>&nbsp;though:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/video_support.png" alt="video_support" width="1440" height="1108"></p>
<h2>List&nbsp;of Task Submissions</h2>
<p>Making mistakes is an important – even necessary – part of any learning process. We encourage you to try out your solutions and submit your attempts. Now you can also take a look at your task submissions, so you can reflect on them and go back to your previous attempts and try to rerun or improve on them:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/submissions.png" alt="submissions" width="1440" height="488"></p>
<h2>More Detailed Output for Python Syntax Errors</h2>
<p>Syntax errors are so common even for professional developers. But syntax errors are not such a big problem with an IDE at your back to help catch and fix them. With more clear and detailed output, PyCharm Edu now helps you catch syntax errors while learning as well:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/syntax_error_output.png" alt="syntax_error_output" width="1440" height="868"></p>
<h1>IntelliJ IDEA Edu and PyCharm Edu 2019.2.2</h1>
<p>Please welcome the IDE builds for PyCharm Edu 2019.2.2 and IntelliJ IDEA Edu 2019.2.2 (IntelliJ IDEA Community Edition with the EduTools plugin). They combine the latest fixes for PyСharm and IntelliJ IDEA and the latest plugin updates in v3.0.</p>
<p><a title="Choose Your Edu IDE" href="https://www.jetbrains.com/education/download/" rel="noopener noreferrer"><i></i>CHOOSE YOUR EDU IDE</a></p>
<p>If you want to try the EduTools plugin with 2019.3 EAP, please follow these <a href="https://www.jetbrains.com/help/education/install-edutools-plugin.html" rel="noopener noreferrer">instructions</a>.</p>
<p>Your feedback is very welcome – leave a comment here, or <a href="https://twitter.com/jetbrains_edu" rel="noopener noreferrer">tweet</a>&nbsp;us. Thanks!</p>
<p>The Educational Products Team</p>
', null, null, 'https://blog.jetbrains.com/blog/2019/10/17/edutools-plugin-v3-0/#comments');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (47, 3, 'https://blog.jetbrains.com/blog/2019/10/22/toolbox-app-1-16-open-files-from-github-gitlab-bitbucket/', 'Toolbox App 1.16 Is Out. Open Files from GitHub, GitLab, and Bitbucket in Your IDE with One Click', '2019-10-22T12:24:13+00:00', 'TLDR; the JetBrains Toolbox extension now can open a line of code you have selected in your IDE in GitHub, GitLab, and Bitbucket. There are new progress bars in the Toolbox App UI, and several bug fixes too. At JetBrains, … Continue reading →', '<p><strong>TLDR; the JetBrains Toolbox extension now can open a line of code you have selected in your IDE in GitHub, GitLab, and Bitbucket. There are new progress bars in the Toolbox App UI, and several bug fixes too.</strong></p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/ToolboxApp_1_16_650x170-1.png" alt="Open GitHub, GutLab, Bitbucket files in your JetBrains IDEs" width="1300" height="340"></p>
<p>At JetBrains, we believe that programming should not be just a job, but a pleasure, a hobby, and a creative outlet. That’s why with this release our team has rebuilt the JetBrains Toolbox extension from the ground up. Now you can easily open your Git repositories in your favorite IDE and navigate from GitHub, GitLab, Bitbucket files, or selected lines of code to the JetBrains IDE that fits best. This nice new integration will save you valuable time.</p>
<h2>GitHub, GitLab, and Bitbucket Integration</h2>
<p>Download the <a href="https://chrome.google.com/webstore/detail/jetbrains-toolbox-extensi/offnedcbhjldheanlbojaefbfbllddna" rel="noopener noreferrer">Chrome</a> and <a href="https://addons.mozilla.org/en-US/firefox/addon/jetbrains-toolbox/" rel="noopener noreferrer">Firefox</a> extensions, and you’ll see just how simple and useful they are. Previously, these extensions were only able to clone and open your Git repositories in your favorite tool. Now they allow you to also open the selected file in your IDE. And what’s more – available from 2019.3 EAP versions of all IDEs – you can navigate to the line of code you have selected from the Git repository service to your IDE with just one click!<br>
<span></span></p>
<p>We’ll demonstrate briefly how the JetBrains extension functions work in the screenshots below:</p>
<ul>
<li>Clone and open your GitHub, GitLab, or Bitbucket repositories in the IDE right from your browser. In the Git project, just click on the icon of the IDE which is the best fit for the project, and open the project there with ease.</li>
</ul>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/Clone-project-at-GitHub-1.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/Clone-project-at-GitHub-1.png" alt="Clone project at GitHub" width="580" height="337"></a></p>
<ul>
<li>Open previously checked out project files in your IDE of choice by clicking the tool icon on the action panel</li>
</ul>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/Screenshot-2019-10-22-at-11.01.07-1.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/Screenshot-2019-10-22-at-11.01.07-1.png" alt="Open GitHub file in your IDE" width="572" height="283"></a></p>
<ul>
<li>Navigate to a line of highlighted code of a previously cloned project in your IDE, by clicking on the JetBrains tool icon located on the file action panel.In GitHub, you can also navigate to the selected line of code right from the line context menu:</li>
</ul>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/Navigate-to-a-line-of-code.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/Navigate-to-a-line-of-code.png" alt="Navigate to a line of code" width="1600" height="578"></a></p>
<p>We hope you enjoy the simplicity and usefulness of the JetBrains Toolbox extension. Download the extension for <a href="https://chrome.google.com/webstore/detail/jetbrains-toolbox-extensi/offnedcbhjldheanlbojaefbfbllddna" rel="noopener noreferrer">Chrome</a> and <a href="https://addons.mozilla.org/en-US/firefox/addon/jetbrains-toolbox/" rel="noopener noreferrer">Firefox</a>, free.</p>
<h2>Updated Toolbox App UI</h2>
<p>We have updated the UI for Toolbox App 1.16. Each tool now has its own update progress bar under each tool.<br>
We have also summarized the progress for all tool updates in the general progress bar, which can be found under the small arrow in the Toolbox App header. Click on it to see the progress of all the tool updates.</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/ToolboxApp1.16.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/10/ToolboxApp1.16.png" alt="Toolbox App 1.16" width="435" height="640"></a></p>
<h2>Bug fixes</h2>
<p>We have fixed the following issues:</p>
<ul>
<li>Issue with the license subscription end date incorrectly showing a day too early. <a href="https://youtrack.jetbrains.com/issue/TBX-3902" rel="noopener noreferrer">TBX-3902</a></li>
<li>Issue preventing changing the tool install locations. <a href="https://youtrack.jetbrains.com/issue/TBX-3994" rel="noopener noreferrer">TBX-3994</a></li>
<li>Project search now shows more relevant results on top. <a href="https://youtrack.jetbrains.com/issue/TBX-3742" rel="noopener noreferrer">TBX-3742</a></li>
</ul>
<p>See the <a href="https://youtrack.jetbrains.com/releaseNotes/TBX?q=fixed+in%3A+1.16.6016+%23Resolved+-Duplicate&amp;title=Toolbox+App+1.16+Release+Notes&amp;showDescription=false&amp;showComments=false" rel="noopener noreferrer">full release notes</a> for all list of bug fixes.</p>
<p><a title="Download now!" href="https://www.jetbrains.com/toolbox-app/" rel="noopener noreferrer">Download Toolbox App 1.16</a></p>
<p>Thanks for reading. Follow <a href="https://twitter.com/JBToolbox" rel="noopener noreferrer">@JBToolbox</a> to stay updated.</p>
<p><em>Your JetBrains Toolbox App team<br>
The Drive to Develop</em></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/10/22/toolbox-app-1-16-open-files-from-github-gitlab-bitbucket/#comments');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (48, 3, 'https://blog.jetbrains.com/blog/2019/10/29/jetbrains-security-bulletin-q3-2019/', 'JetBrains Security Bulletin Q3 2019', '2019-10-29T10:19:31+00:00', 'In the third quarter of 2019, we resolved a series of security issues in our products. Here’s a summary report that contains a description of each issue and the version in which it was resolved. Product Description Severity Resolved in … Continue reading →', '<p>In the third quarter of 2019, we resolved a series of security issues in our products.</p>
<p>Here’s a summary report that contains a description of each issue and the version in which it was resolved.</p>
<p><span></span></p>
<table>
<tbody>
<tr>
<td><strong>Product</strong></td>
<td><strong>Description</strong></td>
<td><strong>Severity</strong></td>
<td><strong>Resolved in</strong></td>
<td><strong>CVE/CWE</strong></td>
</tr>
<tr>
<td>Hub</td>
<td>Username enumeration was possible through password recovery. (<span>JPS-9655, JPS-9938</span>)</td>
<td>Note</td>
<td><span>2019.1.11738</span></td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-18360" rel="noopener noreferrer">CVE-2019-18360</a></td>
</tr>
<tr>
<td>IntelliJ IDEA</td>
<td>Local user privilege escalation potentially allowed arbitrary code execution. (IDEA-216623)</td>
<td>Low</td>
<td>2019.2</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-18361" rel="noopener noreferrer">CVE-2019-18361</a></td>
</tr>
<tr>
<td>JetBrains Account</td>
<td>Account removal without re-authentication was possible. (JPF-9611 reported by Siamul Islam)</td>
<td>Moderate</td>
<td>2019.9</td>
<td><a href="https://cwe.mitre.org/data/definitions/306.html" rel="noopener noreferrer">CWE-306</a></td>
</tr>
<tr>
<td>JetBrains Account</td>
<td>Password reset link was not invalidated during password change through profile. (JPF-9610 reported by Elliot V. Daniel)</td>
<td>Moderate</td>
<td>2019.8</td>
<td><a href="https://cwe.mitre.org/data/definitions/613.html" rel="noopener noreferrer">CWE-613</a></td>
</tr>
<tr>
<td>MPS</td>
<td>Ports listened to by MPS are exposed to the network. (MPS-30661)</td>
<td>Low</td>
<td>2019.2.2</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-18362" rel="noopener noreferrer">CVE-2019-18362</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>Access could be gained to the history of builds of a deleted build configuration under some circumstances. (TW-60957)</td>
<td>Moderate</td>
<td>2019.1.2</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-18363" rel="noopener noreferrer">CVE-2019-18363</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>Insecure Java Deserialization could potentially allow RCE. (TW-61928 reported by Aleksei “GreenDog” Tiurin)</td>
<td>Moderate</td>
<td>2019.1.4</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-18364" rel="noopener noreferrer">CVE-2019-18364</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>Reverse tabnabbing was possible on several pages. (TW-61323, TW-61725, TW-61726, TW-61646, TW-62123)</td>
<td>Low</td>
<td>2019.1.4</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-18365" rel="noopener noreferrer">CVE-2019-18365</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>Secure values could be exposed to users with the ‘View build runtime parameters and data’ permission.</td>
<td>Low</td>
<td>2019.1.2</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-18366" rel="noopener noreferrer">CVE-2019-18366</a></td>
</tr>
<tr>
<td>TeamCity</td>
<td>A non-destructive operation could be performed by a user without the corresponding permissions. (TW-61107)</td>
<td>Low</td>
<td>2019.1.2</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-18367" rel="noopener noreferrer">CVE-2019-18367</a></td>
</tr>
<tr>
<td>Toolbox App</td>
<td>Privilege escalation was possible in the JetBrains Toolbox App for Windows. (TBX-3759)</td>
<td>Low</td>
<td>1.15.5666</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-18368" rel="noopener noreferrer">CVE-2019-18368</a></td>
</tr>
<tr>
<td>YouTrack</td>
<td>Sending of arbitrary spam email from a YouTrack instance was possible. (JT-54136, ADM-13823, ADM-34971)</td>
<td>Low</td>
<td>Not applicable</td>
<td><a href="https://cwe.mitre.org/data/definitions/285.html" rel="noopener noreferrer">CWE-285</a></td>
</tr>
<tr>
<td>YouTrack</td>
<td>Removing tags from issues list without corresponding permission was possible. (JT-53465)</td>
<td>Low</td>
<td>2019.2.55152</td>
<td><a href="https://nvd.nist.gov/vuln/detail/CVE-2019-18369" rel="noopener noreferrer">CVE-2019-18369</a></td>
</tr>
</tbody>
</table>
<p>If you need any further assistance, please contact our&nbsp;<a href="mailto:security@jetbrains.com" rel="noopener noreferrer">Security Team</a>.</p>
<p><a href="https://www.jetbrains.com/security/subscribe" rel="noopener noreferrer">Subscribe</a>&nbsp;to receive the bulletin in your mailbox.</p>
<p><em>Your JetBrains Team<br>
The Drive to Develop</em></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/10/29/jetbrains-security-bulletin-q3-2019/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (49, 3, 'https://blog.jetbrains.com/blog/2019/11/13/jetbrains-supports-numfocus-sponsored-open-source-projects/', 'JetBrains Supports NumFOCUS-sponsored Open Source Projects', '2019-11-13T12:45:35+00:00', 'Open source software is an essential part of most software projects, and it is vital for healthy progress in modern engineering and research. For years, JetBrains has been committed to supporting those who invest their time and expertise to contribute … Continue reading →', '<p>Open source software is an essential part of most software projects, and it is vital for healthy progress in modern engineering and research. For years, JetBrains has been committed to supporting those who invest their time and expertise to contribute to open source projects and ultimately advance the entire software ecosystem. We have <a href="https://www.jetbrains.com/community/opensource/" rel="noopener noreferrer">provided free licenses</a> to thousands of large and small non-commercial OS projects developed and maintained by the community.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/DSGN-8261_web_banners_NumFOCUS3_tw_800x418.png" alt="JetBrains Supports NumFOCUS-sponsored Open Source Projects" width="800" height="419"><br>
<span></span><br>
In the world of data science and scientific computing, new tools, new software products, new scientific discoveries, and new research studies all rely heavily on open source data science tools such as pandas, NumPy, SciPy, and Matplotlib. These and other projects are sponsored by <a href="https://numfocus.org/" rel="noopener noreferrer">NumFOCUS</a>, a nonprofit that supports open source scientific computing through fiscal sponsorship of projects and community-building educational programs.</p>
<p>We at JetBrains appreciate all the hard work that NumFOCUS project committers do for the growth and development of the open source ecosystem. We believe that using the best tools can help make your work more enjoyable and productive. So if you’re a project lead of a NumFOCUS-sponsored project, consider <a href="https://www.jetbrains.com/shop/eform/opensource?product=ALL" rel="noopener noreferrer">applying to get complimentary All Products Packs</a> for your whole team!</p>
<p>Thank you once again for your commitment to open practices in research, data, and scientific computing!</p>
', null, null, 'https://blog.jetbrains.com/blog/2019/11/13/jetbrains-supports-numfocus-sponsored-open-source-projects/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (50, 3, 'https://blog.jetbrains.com/blog/2019/11/20/jetbrains-website-is-multilingual/', 'The Official JetBrains Website is Now Multilingual', '2019-11-20T10:42:51+00:00', 'Read this post in Chinese (Simplified), French, Japanese, Korean, Russian. As a tech company, we do our best to support the most popular programming languages and technologies. As a global company, we consider it our responsibility to make sure that … Continue reading →', '<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/blog-1.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/blog-1.png" alt="blog (1)" width="1600" height="800"></a></p>
<p><em>Read this post in <a href="https://blog.jetbrains.com/cn/2019/11/jetbrains-cn/" rel="noopener noreferrer">Chinese (Simplified)</a>, <a href="https://blog.jetbrains.com/fr/2019/11/le-site-web-de-jetbrains-est-desormais-disponible-en-francais/" rel="noopener noreferrer">French</a>, <a href="https://blog.jetbrains.com/jp/2019/11/19/2388/" rel="noopener noreferrer">Japanese</a>, <a href="https://blog.jetbrains.com/kr/2019/11/jetbrains-%EA%B3%B5%EC%8B%9D-%EC%9B%B9%EC%82%AC%EC%9D%B4%ED%8A%B8%EA%B0%80-%EC%9D%B4%EC%A0%9C-%ED%95%9C%EA%B5%AD%EC%96%B4%EB%A5%BC-%EC%A7%80%EC%9B%90%ED%95%A9%EB%8B%88%EB%8B%A4/" rel="noopener noreferrer">Korean</a>, <a href="https://habr.com/ru/company/JetBrains/blog/476370/" rel="noopener noreferrer">Russian</a>.<br>
</em><br>
As a tech company, we do our best to support the most popular programming languages and technologies. As a global company, we consider it our responsibility to make sure that people speaking different languages and coming from different cultural backgrounds can easily access information about JetBrains products.</p>
<p>Choosing the right development or teamwork tool is now much easier, as www.jetbrains.com is available in Chinese (Simplified), French, German, Japanese, Korean, Russian, Spanish. We’ll be expanding the list of supported languages.</p>
<p>You can switch to the language of your choice using the selector at the bottom of the page.</p>
<p>We greatly appreciate your feedback: there’s a button on the right side of every page allowing you to highlight an area on the page and provide a comment.</p>
<p>Check out our website in <a href="https://www.jetbrains.com/zh-cn/" rel="noopener noreferrer">Chinese (Simplified)</a>, <a href="https://www.jetbrains.com/fr-fr/" rel="noopener noreferrer">French</a>, <a href="https://www.jetbrains.com/de-de/" rel="noopener noreferrer">German</a>, <a href="https://www.jetbrains.com/ja-jp/" rel="noopener noreferrer">Japanese</a>, <a href="https://www.jetbrains.com/tl-aa/" rel="noopener noreferrer">Klingon</a>, <a href="https://www.jetbrains.com/ko-kr/" rel="noopener noreferrer">Korean</a>, <a href="https://www.jetbrains.com/ru-ru/" rel="noopener noreferrer">Russian</a>, <a href="https://www.jetbrains.com/es-es/" rel="noopener noreferrer">Spanish</a>!</p>
<p><em>The JetBrains Team</em></p>
', null, null, 'https://blog.jetbrains.com/blog/2019/11/20/jetbrains-website-is-multilingual/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (51, 3, 'https://blog.jetbrains.com/blog/2019/11/22/jetbrains-7th-annual-hackathon/', 'JetBrains 7th Annual Hackathon: Arranged Differently', '2019-11-22T14:33:11+00:00', 'Arranging a new hackathon The arrangement With the expansion of JetBrains this year and the move into our new offices, we had to push back this year’s hackathon a little bit. But, if anything, this ignited the drive to develop … Continue reading →', '<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/hackathon-logo.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/hackathon-logo.png" alt="Hackathon 7 graphic" width="1761" height="482"></a></p>
<h1>Arranging a new hackathon</h1>
<p><strong>The arrangement</strong><br>
With the expansion of JetBrains this year and the move into our new offices, we had to push back this year’s hackathon a little bit. But, if anything, this ignited the drive to develop new ideas in our team. So here is a rundown of what went down this year.</p>
<p>The rules were simple:</p>
<ol>
<li>The Hackathon began Wednesday, September 18th, at noon sharp CEST and ran for 48 hours.</li>
<li>The last commit was allowed no later than Friday, September 20th, noon CEST. Presentations needed to be provided to the Org.Committee by this time as well.</li>
<li>5-minute presentations started 1 hour later, at 13:00 CEST on the same Friday.</li>
<li>Winners received prizes</li>
</ol>
<h2>Arranging the event</h2>
<blockquote><p>“Arrange whatever pieces come your way.” – Virginia Woolfe</p></blockquote>
<p>This year’s theme was “arrange it your way.” The principle behind this is that there is no single way to do things, no unique solution, that the parts can be arranged in an infinite number of different combinations.<br>
This year, even more ideas and concepts for projects were put forward than ever before. 70 projects were submitted by the 182 participants ready to bring their ideas to life. There are no limits to what people can dream up, but there were most definitely some common themes that emerged throughout.</p>
<p>On Wednesday, registration opened at 10am, providing participants with all the gear they would need to get through the two days: a toothbrush, a t-shirt, badges, and stickers.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/3F5A7297.jpg" alt="3F5A7297" width="2400" height="1600"></p>
<p>The 56 projects that finished could not have been more different or more incredible. Teams again embraced this opportunity to explore their limits, finding issues in their own spaces, and exploring solutions to fix them. Here is a look at just some of the projects (remember: this was done in only 48 hours).</p>
<p><span></span></p>
<h2>Arranging the winners</h2>
<p>This year, there was a bit of a twist thrown in, with a surprising new method to decide the final winners.</p>
<p>A jury representing different teams and roles was brought in to:</p>
<ul>
<li>define nominations based on the types of projects that were ultimately submitted</li>
<li>pick projects that stood out among those nominations</li>
</ul>
<p>All the prizes were of the same value, and there was no limit to the number of projects that could win.</p>
<p>There was, of course, only one Trophy Winner, whose name is engraved on the legendary JB Hackathon Cup. The winner was decided by the individual votes from JetBrainers.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/3F5A7372.jpg" alt="3F5A7372" width="2400" height="1600"></p>
<h1>The categories</h1>
<h2>Business Value</h2>
<p>Awarded to the hackathon project which could provide the most value to the business</p>
<p><strong>Plugin Bundles</strong><br>
Mikhail Vink, Ivan Chirkov, Sergey Kesarev.</p>
<p>The idea behind this project was simple: JetBrains product + Plugin(s) = Bundle. So the team set out to create a means to distribute the IDE along with selected plugins. They wanted to provide additional value to users, promote high-quality plugins, add a new method of marketing (as bundles can target specific needs), add some cross-selling potential, and reduce costs.</p>
<p>So their goal for the hackathon was to:<br>
Add a one-click purchasing option for plugins bundled with the IDE.<br>
Experiment with using IntelliJ IDEA protocol and Toolbox integration.<br>
Add bundle management support at plugins.jetbrains.com.<br>
Prepare a pricing model for bundles with paid plugins.<br>
Create marketing assets for some plugin bundles (and possibly a way to generate the assets semi-automatically).</p>
<p>They successfully created 10 bundles that will be supported in the Toolbox App and in the plugin repository (it’s coming in one of the next releases, stay tuned). So whichever specific technology you work with, there is going to be a bundle of plugins to help.<br>
<a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/bundles-image.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/bundles-image.png" alt="Plugin bundles" width="2404" height="1358"></a></p>
<h2>Best Presentation</h2>
<p>Awarded to the hackathon project with the best presentation.</p>
<p><strong>Local History Browser </strong><br>
Maarten Balliauw, Matt Ellis</p>
<p></p>
<h2>Best Tangible Mod</h2>
<p>Awarded to the hackathon project with the best hardware design.</p>
<p><strong>Apple Touch Bar Back to Basics (PushBar)</strong><br>
Ivan Kuleshov<br>
The hardware mod for Apple Touch Bar</p>
<p>In 2016, Apple decided that the “F” keys were not as crucial as smiley faces. So on their MacBook Pro, they got rid of them. What does one do when these essential buttons are missing? They hack one together. 30 hours of development, 3 apple keyboards, 2 pre-2016 Apple MacBook Pros, 18 cups of coffee, and 5 different concepts later… that is precisely what was done.</p>
<p>2 versions were produced for users to update their MacBook to the newest hardware. Welcome to a new age, Apple MacBook Pro Touch Bar Pro.</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/image2019-9-24-9_38_16.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/image2019-9-24-9_38_16.png" alt="Apple push bar pro" width="756" height="567"></a></p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/image2019-9-24-9_42_42.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/image2019-9-24-9_42_42.png" alt="Apple push bar" width="1091" height="738"></a></p>
<h2>Coolest Idea</h2>
<p><strong>Extrasense</strong><br>
Dmitry Neverov, Victor Matchenko</p>
<p>Get extra information about how your program behaves, using one of your five senses that has long been overlooked in programming: hearing. Imagine being able to tune your breakpoints like you would a guitar, so when you debug a program, you can notice immediately when something is off. This can be useful if you have several threads of execution or a graphical user interface that also requires your attention, for example, an IDE. It can be particularly helpful for looking at cache assembly time. You can set up several “Extrasense” sound breakpoints, and if you hear the sound, that means the cache doesn’t work. With this approach, silence truly becomes golden. It will also help you understand the frequency of events, for instance, checking how often your web application calls the database. Also included is a continuous sine wave that is modulated through the allocation rate, which produces high pitched sounds when you do a massive computation. So with all this, you can literally tune your performance like you would with a tuning fork.</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/extrasense.gif" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/extrasense.gif" alt="Sound wave demo" width="968" height="416"></a></p>
<h2>Most Useful Developer Tool</h2>
<p><strong>Spot profiler for IDEA </strong><br>
Dmitry Batrak<br>
<a href="https://plugins.jetbrains.com/plugin/13355-spot-profiler-for-java/" rel="noopener noreferrer">Spot profiler plugin</a><br>
Automate ‘manual’ profiling (wrapping part of code in <code>long start=System.nanoTime()</code>, <code>System.out.println(System.nanoTime() - start)</code>),displaying results right in editor.</p>
<p>This project took on the epic task of helping people make their code faster. So when considering measuring the execution time for a piece of code in the millisecond time range, a traditional profiler is not a great option as the sampling is not precise enough, and tracing usually adds overhead. What people typically do is insert the measurement instructions into their code. But, this does come with some shortcomings like working with VCS, and the results need to be read in the console.</p>
<p>So a better option is Spot profiler for IntelliJ IDEA. JPS lets us transform the source code before parsing it to JavaC. IntelliJ IDEA can read the output and show the results in the editor, showing you the execution times for the certain lines right there in the editor.</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/spot-profiler.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/spot-profiler.png" alt="Spot profiler to show the execution times for lines of code" width="1717" height="740"></a></p>
<h2>Most Entertaining</h2>
<p><strong> CodeQuiz </strong><br>
Svetlana Isakova, Sebastian Aigner, Ilya Chernikov, Pavel Nikolaev, Alexander Anisimov</p>
<p>What do you get if you create a game-based service similar to Kahoot! for “social learning” at conferences, talks, and training sessions, which can also be used later as a Kotlin MPP (Ktor + Kotlin/React) sample project? You get CodeQuiz.</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/code-quiz.gif" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/code-quiz.gif" alt="code quiz hackathon game" width="750" height="422"></a></p>
<h2>Office Life</h2>
<p>Awarded to the hackathon project that best streamlined office life</p>
<p><strong>Hello, Space!</strong><br>
Irina Manolova, Andrew Vasiliyev, Evelina Yun, Daria Pavlyuk, Maria Mikheyshina, and Alexandra Charikova.</p>
<p>Space is the name of our office in Saint Petersburg. It is big, it is new, and it needs help with onboarding new colleagues. “Hello, Space!” is a great start. This project makes the lives of HR easier and the experience that new employees have better! HR simply needs to fill out the details for the new employee:</p>
<p>From here it activates the automated ‘before your first-day’ campaign, which consists of a series of how-to welcome emails about Space office life (where to get food / borrow books from the library / join in with sports / recycle plastic / find the first aid kit etc.).</p>

<a href="https://blog.jetbrains.com/blog/2019/11/22/jetbrains-7th-annual-hackathon/email-6/" rel="noopener noreferrer"><img width="406" height="1156" src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/email-6.png" alt="email 6"></a>
<a href="https://blog.jetbrains.com/blog/2019/11/22/jetbrains-7th-annual-hackathon/email-5/" rel="noopener noreferrer"><img width="542" height="1366" src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/email-5.png" alt="email 5"></a>
<a href="https://blog.jetbrains.com/blog/2019/11/22/jetbrains-7th-annual-hackathon/email4/" rel="noopener noreferrer"><img width="540" height="1405" src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/email4.png" alt="email4"></a>

<h2>Actively Used</h2>
<p><strong>HTF (How To Find) app</strong><br>
Natalia Mashianova, Maxim Mazin, Elizaveta Semakova, Nastia Berezinskaya, Andrey Skladchikov, Oleg Bakhirev, Ekaterina Zaikina.</p>
<p>Last year’s HTF (How To Find) app (version 1.0), won the CEO’s choice prize. This year it has gone on to win the most actively used category.</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2018/08/htf-edited.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2018/08/htf-edited.png" alt="htf 1.0" width="1877" height="1655"></a></p>
<h1>Arranging Onboarding projects</h1>
<p>It is no surprise that with the massive rate of growth JetBrains has been experiencing, the topic of interest that a lot of teams gathered together to solve was focused around onboarding. With no universal onboarding program in place, HTF app 2.0 and four of the other 56 projects submitted aimed to help make integration and fitting into the company a little smoother.</p>
<p><strong>HTF (How To Find) app 2.0. </strong><br>
Natalia Mashianova, Maxim Mazin, Nastia Berezinskaya, Oleg Bakhirev, Arkady Bazhanov, and Ekaterina Zaikina</p>
<p>Revisiting their successful “HTF (How To Find) app,” which won the CEO’s choice last year, the team set out to improve the system integrated with our internal systems. In an attempt to help people across different offices in the company get acquainted with each other, the new variant of the app is filterable by the offices and teams, and the score is now saved, so you have a record of who you know and don’t know. The UI was also updated to make it even easier to look for colleagues and get to know them a little better.</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/HTF-2.0-app.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/HTF-2.0-app.png" alt="htf 2point0" width="1600" height="815"></a></p>
<p><strong>Hello, Space!</strong><br>
Irina Manolova. Andrew Vasilyev, Evelina Yun, Daria Pavlyuk, Maria Mikheyshina, and Alexandra Charikova</p>
<p>As you may have gathered from the previous description, this automated onboarding program helps newcomers coming to the new Saint Petersburg Space office. And as if that were not enough, they also created an autonomous chat Bot that can search and tell you the must-know information you need to survive in the Space office.<br>
<a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/space-ranger.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/space-ranger.png" alt="spaceranger slackbot" width="1643" height="605"></a></p>
<p><strong>Random Coffee (JetMate)</strong><br>
Yuriy Artamonov, Anastasia Goncharova, Yulia Obnovlenskaya, Sergey Boytsov, Alexander Izmaylov</p>
<p>With over 1154 people now working at JetBrains, it can be hard to know people, especially those who share similar passions to you. Developed to help people get to know each other and find common interests around the office, Random Coffee lets you book a 10-minute random coffee meeting and get to know someone new.</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/start.gif" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/start.gif" alt="coffeemate in action" width="421" height="688"></a></p>
<p><strong>The Onboarding Game</strong><br>
Oscar Rodriguez, Ekaterina Ryabukha, and Joaquin Trevino.<br>
A kind of treasure hunt for new (or not that new) employees to find different important documents, content, and internal platforms that every employee of JetBrains should know.</p>
<p>This project sets out to gamify the process of onboarding employees, leading them around the different platforms using clues and puzzles where they will find the next piece of information they need to know.</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/onboarding-game.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/onboarding-game.png" alt="Follow the white rabbit" width="1689" height="666"></a></p>
<p><strong>Lego BrainStorms</strong><br>
David Watson, Henry Wylde, Nikolay Sandalov, Scott Adams, Ekaterina Ivanova, Tobias Kahlert, Nadya Davydova, Pavel Ivanov, and Arina Chubarkova</p>
<p>Even this project had a go at improving onboarding, adapting their original concept of using the TeamCity Lego men booth swag to make onboarding webcomics for new employees to take them through their first day.</p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/comic.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/comic.png" alt="d1D j00 kN0w J378r41n2 12 4lW4Y2 H1R1N9? ch3CK 0u7 73h K4r33r2 P493 4nD 533 1f 7H3r3 12 4 J08 F0r J00 0R 4 KW357 cH4LL3n93 70 90 fUr7h3r @ l3457." width="1129" height="773"></a></p>
<p><a href="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/perks-saint-petersberg.png" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/perks-saint-petersberg.png" alt="JetBrains office perks 1" width="1287" height="1657"></a></p>
<h1>Arranging the Trophy Winner</h1>
<p>There can be only one grand prize winner. With its third mention in this blog post alone, the winner of JetBrains Hackathon 7 is…</p>
<p><strong> Hello, Space! </strong><br>
Irina Manolova, Andrew Vasiliyev, Evelina Yun, Daria Pavlyuk, Maria Mikheyshina, and Alexandra Charikova.</p>
<p>This project won the hearts and minds of many JetBrainers this year. With no formal onboarding in place, this project really did tick a lot of boxes for what every new employee needs when coming into the company. It covered all the aspects of getting acquainted with JetBrains in a good amount of detail and was very easy to set up.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/3F5A7441.jpg" alt="3F5A7441" width="2400" height="1600"></p>
<p>Congratulations!!</p>
<h1>The numbers arranged</h1>
<p>0 disappointment<br>
1 trophy<br>
2 days<br>
6 hours 22 minutes of presentations<br>
7 categories<br>
9 awards<br>
12 guests<br>
56 projects finished<br>
70 projects submitted<br>
182 participants<br>
305 votes<br>
18,000 dollars worth of prizes</p>
<hr>
<p>JetBrains 6th Annual Hackathon: Shiftius Altius Ctrlius.&nbsp;<a href="https://blog.jetbrains.com/blog/2018/08/03/jetbrains-6th-annual-hackathon/" rel="noopener noreferrer">Check it out</a>!</p>
<hr>
<p>JetBrains<br>
The Drive to Develop</p>
', null, null, 'https://blog.jetbrains.com/blog/2019/11/22/jetbrains-7th-annual-hackathon/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (52, 3, 'https://blog.jetbrains.com/blog/2019/11/29/come-discuss-cloud-native-development-at-aws-reinvent/', 'Come Discuss Cloud-native Development at AWS re:Invent', '2019-11-29T15:40:13+00:00', 'Are you attending AWS re:Invent in Las Vegas on December 2–6? So are we! And we would love to meet up with you! Visit the JetBrains booth in the Venetian Expo Area to meet the team and chat about how … Continue reading →', '<p>Are you attending AWS re:Invent in Las Vegas on December 2–6? So are we! And we would love to meet up with you!</p>
<p><a href="https://calendly.com/teamcity/30?month=2019-12" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/11/reInvent19_Partner_BannerJB_728x90.png" alt="reInvent19_Partner_BannerJB_728x90" width="1456" height="200"></a></p>
<p>Visit the JetBrains booth in the Venetian Expo Area to meet the team and chat about how JetBrains’ tools can help you develop for the cloud. We have a ton of awesome features in our IDEs for developing cloud-native applications on AWS, including development and local debugging of Lambdas, CloudFormation and Terraform plugins to work with Infrastructure-as-Code definitions, remote debugging and remote interpreters for Python, Ruby, JavaScript, and PHP. There is <a href="https://www.jetbrains.com/devops/amazon-aws/" rel="noopener noreferrer">so much more</a> to these integrations, and we are excited to show them off at our booth. And of course, there will be some swag to pick up as well!</p>
<p>Also, if you are looking for a powerful CI/CD solution to support your cloud-native workflows out of the box, we would be happy to talk about <a href="https://www.jetbrains.com/teamcity/" rel="noopener noreferrer">TeamCity</a> with you. TeamCity supports complex container scenarios and can dynamically spin up EC2 and ECS instances&nbsp;– all while optimizing your CI/CD pipelines to save up to 30% of your build time and resources. We’d be happy to arrange a <a href="https://calendly.com/teamcity/30?month=2019-12" rel="noopener noreferrer">personal demo</a> for you to go over the possibilities.</p>
<p>Book your time with a TeamCity expert right now – <a href="https://calendly.com/teamcity/30?month=2019-12" rel="noopener noreferrer">pick </a><a href="https://calendly.com/teamcity/30?month=2019-12" rel="noopener noreferrer">a time slot</a> while they still last.</p>
<p>
  <a href="https://calendly.com/teamcity/30?month=2019-12" rel="noopener noreferrer"><br>
    Schedule a TeamCity Demo<br>
  </a>
</p>
<p>We look forward to meeting you at AWS re:Invent!</p>
', null, null, 'https://blog.jetbrains.com/blog/2019/11/29/come-discuss-cloud-native-development-at-aws-reinvent/#respond');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (53, 3, 'https://blog.jetbrains.com/blog/2019/12/05/jetbrains-academy-kotlin/', 'JetBrains Academy Welcomes Kotlin On Board!', '2019-12-05T09:10:55+00:00', 'In February, we launched JetBrains Academy – an educational platform for future professionals. We started with Java, and during these first months, we’ve worked to identify and adopt the learning concepts we believe in. Now it’s time to take it … Continue reading →', '<p>In February, <a href="https://blog.jetbrains.com/blog/2019/02/27/jetbrains-academy-eap/" rel="noopener noreferrer">we launched JetBrains Academy</a> – an educational platform for future professionals. We started with Java, and during these first months, we’ve worked to identify and adopt the learning concepts we believe in. Now it’s time to take it a step further. We’re excited to announce that the Kotlin track is ready for you!</p>
<p><a href="https://hi.hyperskill.org/" rel="noopener noreferrer"><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/jba_learners.png" alt="jba_learners" width="343" height="343"></a>We are passionate about learning and believe in the following:</p>
<ul>
<li>Learning programming language concepts alone is never enough. The best way to learn is to go beyond lectures and learn by doing.</li>
<li>It’s never too late to pursue your dream job. Every learning goal is achievable with a step-by-step plan and instant feedback.</li>
<li>Mastering professional tools and creating a portfolio is an essential part of learning to program.</li>
</ul>
<p><strong><a href="https://hi.hyperskill.org/" rel="noopener noreferrer">If you share these values, don’t hesitate to join us and start learning!</a></strong></p>
<p><span></span></p>
<h1>Learn Kotlin step by step by building working apps</h1>
<p>If you’re just starting out and taking your first steps with Kotlin, you can get your journey off to a good start by following our <a href="https://hyperskill.org/onboarding/" rel="noopener noreferrer">Kotlin Track</a>:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-01.54.47-1-1.png" alt="" width="2560" height="1365"></p>
<p>You will need to choose your level and pick a project that interests you:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-02.01.04-.png" alt="Screenshot 2019-12-05 at 02.01.04" width="2560" height="2258"></p>
<p>Now you’re ready to register/log in and start learning.</p>
<p>Each project has learning outcomes and is split into stages. Stages help you progress from simple to more advanced code, allowing you to add more functionality to your working app at each stage:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-02.11.13-.png" alt="Screenshot 2019-12-05 at 02.11.13" width="2560" height="2384"></p>
<p>Each stage of a project includes a list of topics you need to complete to progress&nbsp;with the stage:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-02.17.13-.png" alt="Screenshot 2019-12-05 at 02.17.13" width="2560" height="3047"></p>
<p>Each topic focuses on explaining one concept in detail using multiple examples of the relevant code. Topics can take around 15 minutes to complete:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-02.28.51-.png" alt="Screenshot 2019-12-05 at 02.28.51" width="2560" height="1600"></p>
<p>Each topic has quizzes and code challenges that you can solve in your browser:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-02.31.11-.png" alt="Screenshot 2019-12-05 at 02.31.11" width="2560" height="1600"></p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-02.43.41-.png" alt="Screenshot 2019-12-05 at 02.43.41" width="2560" height="2537"></p>
<p>… or right inside <a href="https://www.jetbrains.com/education/download/#section=idea-Kotlin" rel="noopener noreferrer">IntelliJ IDEA</a> or <a href="https://www.jetbrains.com/help/education/install-edutools-plugin.html?section=Android%20Studio" rel="noopener noreferrer">Android Studio</a>:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-02.48.35-.png" alt="Screenshot 2019-12-05 at 02.48.35" width="2560" height="1600"></p>
<p>The IDE can help you with the code challenges, thanks to its advanced code analysis and quick-fix options:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-02.51.31-.png" alt="Screenshot 2019-12-05 at 02.51.31" width="2559" height="750"></p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-02.52.08-.png" alt="Screenshot 2019-12-05 at 02.52.08" width="2559" height="750"></p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-02.52.47-.png" alt="Screenshot 2019-12-05 at 02.52.47" width="2559" height="750"></p>
<p>We recommend building all the project stages right inside the IDE:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-02.58.43-.png" alt="Screenshot 2019-12-05 at 02.58.43" width="2560" height="1600"></p>
<p>When the project is ready, it can be uploaded to your portfolio on GitHub:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-00.02.20-.png" alt="Screenshot 2019-12-05 at 00.02.20" width="2560" height="1600"></p>
<h1>Practice Kotlin concepts with interactive challenges</h1>
<p>If you already have experience with Kotlin and just want to fill in some gaps, the advanced search will provide a handful of cheat sheets with summaries you can revise, it is a good starting point:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-03.16.31-.png" alt="Screenshot 2019-12-05 at 03.16.31" width="2560" height="1600"></p>
<p>The best way to check your knowledge and understanding of a concept is to solve some challenges:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-03.28.35-.png" alt="Screenshot 2019-12-05 at 03.28.35" width="2560" height="1600"></p>
<p>Within the theory and practice exercises, each topic has a list of related topics:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-03.31.27-.png" alt="Screenshot 2019-12-05 at 03.31.27" width="2560" height="1600"></p>
<p>If you want an overview of all the Kotlin concepts – to check for gaps in your knowledge and see which topics you can learn to fill them – our custom Knowledge Map shows the full scope of topics and the connections between them:</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/Screenshot-2019-12-05-at-03.33.05-.png" alt="Screenshot 2019-12-05 at 03.33.05" width="2560" height="1600"></p>
<p>In the Knowledge Map, you can also switch to more general topics to learn and practice computer algorithms, developer tool essentials, and more.</p>
<h1>What’s the next step?</h1>
<p><a title="Visit JetBrains Academy" href="https://www.jetbrains.com/academy" rel="noopener noreferrer"><i></i>VISIT JETBRAINS ACADEMY</a></p>
<p>JetBrains Academy is free of charge while in Early Access, so give it a try. Start learning, build your first project, and tell us what you think, either here in the comments or on <a href="https://twitter.com/jetbrains_edu" rel="noopener noreferrer">Twitter</a>.</p>
<p>If you’re at KotlinConf, don’t miss the JetBrains Academy office hour at the Kotlin booth at 14:45 CET with <a href="https://twitter.com/truesebi" rel="noopener noreferrer">@TrueSebi</a>!</p>
<p>If you’re an educator and want to collaborate with us, email us at <a href="mailto:academy@jetbrains.com" rel="noopener noreferrer">academy@jetbrains.com</a>.</p>
<p>The Educational Products Team</p>
', null, null, 'https://blog.jetbrains.com/blog/2019/12/05/jetbrains-academy-kotlin/#comments');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (54, 3, 'https://blog.jetbrains.com/blog/2019/12/05/welcome-to-space/', 'Welcome to Space!', '2019-12-05T17:42:06+00:00', 'Today at KotlinConf, we announced our brand new product Space, and we have already opened the Early Access Program. What is Space Space is an integrated team environment that provides teams and organizations with the tools they need to collaborate … Continue reading →', '<p>Today at <a href="https://kotlinconf.com/" rel="noopener noreferrer">KotlinConf</a>, we announced our brand new product <a href="https://jetbrains.com/space" rel="noopener noreferrer">Space</a>, and we have already opened the <a href="https://www.jetbrains.com/space/#request-eap-invite" rel="noopener noreferrer">Early Access Program</a>.</p>
<p></p>
<p><span></span></p>
<h2>What is Space</h2>
<p>Space is an integrated team environment that provides teams and organizations with the tools they need to collaborate effectively and efficiently. It has Git-based Version Control, Code Review, Automation (CI/CD) based on Kotlin Scripting, Package Repositories, Planning tools, Issue Tracker, Chats, Blogs, Meetings, and Team Directory, among other features.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/project_dashboard.png" alt="project_dashboard" width="2880" height="1638"></p>
<p>Space was born out of our own needs at JetBrains. As a company, we’ve grown from a team of 3 developers to over 1200 people, 60% of whom are technical. With this growth, we’ve found our current use of independent tools has often created silos, leading to miscommunication, less efficient collaboration, and loss of information.</p>
<h2>Space is about people and teams</h2>
<p>In Space, the concept of a team is a first-class citizen. When you join a team, you are automatically included in everything related to it, be it meetings, blogs, source control, calendars, vacations, etc. This eliminates the need for creating concepts such as groups and then making sure that every team member is also part of the corresponding group.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/member_profiles.png" alt="member_profiles" width="2880" height="1736"></p>
<p>Tight integration between the areas of the system provides for numerous advantages such as knowing a person’s availability, which is useful if you want to have a chat or assign a code review to them.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/integrated_with_profiles.png" alt="integrated_with_profiles" width="2880" height="1780"></p>
<h2>Space is a platform</h2>
<p>Space allows you to build on the platform in multiple ways. Whether you do so by using webhooks, HTTP API, or even plugins (on the self-hosted version), you can extend the existing functionality of Space and make use of the information available to you without needing to hook up many different solutions that create silos of data.</p>
<h2>Space as a service or self-hosted</h2>
<p>We will be offering Space either as a service, hosted and managed entirely by JetBrains, or as a self-hosted version (available in the near future). The pricing plan has four levels, starting at the free tier, which is ideal for small teams, and progressing up to the Enterprise tier, which meets the needs of large organizations.</p>
<p><img src="https://d3nmt5vlzunoa1.cloudfront.net/wp-content/uploads/2019/12/pricing.png" alt="pricing" width="2634" height="1126"></p>
<h2>Space is available everywhere</h2>
<p>Built from the ground up with <a href="https://kotlinlang.org/" rel="noopener noreferrer">Kotlin</a> multiplatform technology, Space clients are available for web, desktop, and mobile platforms, and offer full IDE integration with the <a href="https://www.jetbrains.com/opensource/idea/" rel="noopener noreferrer">IntelliJ Platform</a>.</p>
<h2>Space Launch and roadmap</h2>
<p>Today we already provide a ton of functionality, such as:</p>
<ul>
<li>Version Control</li>
<li>Code Reviews</li>
<li>Blogs</li>
<li>Chats</li>
<li>Team Directory</li>
<li>Package Registry</li>
<li>Planning</li>
<li>Issue Tracker</li>
<li>IDE Integration</li>
</ul>
<p>We have a lot more planned for Space, including:</p>
<ul>
<li>Knowledge Base</li>
<li>Automation</li>
<li>CI/CD Pipelines</li>
<li>Personal To-Do lists and notification management</li>
</ul>
<p>The Early Access Program will be accepting requests on a first-come-first-served basis, and we’ll be gradually increasing the number of teams that can gain access. So don’t wait! <a href="https://www.jetbrains.com/space/#request-eap-invite" rel="noopener noreferrer">Sign up</a> now to get your team Space!</p>
', null, null, 'https://blog.jetbrains.com/blog/2019/12/05/welcome-to-space/#comments');
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (55, 4, 'https://reactjs.org/blog/2018/10/23/react-v-16-6.html', 'React v16.6.0: lazy, memo and contextType', '2018-10-23T00:00:00+00:00', 'Today we’re releasing React 16.6 with a few new convenient features. A form of PureComponent/shouldComponentUpdate for function components, a way to do code splitting using Suspense and an easier way to consume Context from class components.
Check out the full changelog below.
React.memo
Class components can bail out from rendering when their input props are the same using PureComponent or shouldComponentUpdate. Now you can do the same with function components by wrapping them in React.memo.
const MyComponent = React.memo(function MyComponent(props) {
  /* only rerenders if props change */
});
React.lazy: Code-Splitting with Suspense
You may have seen Dan’s talk about React Suspense at JSConf Iceland. Now you can use the Suspense component to do code-splitting by wrapping a dynamic import in a call to React.lazy().
import React, {lazy, Suspense} from ''react'';
const OtherComponent = lazy(() =&gt; import(''./OtherComponent''));

function MyComponent() {
  return (
    &lt;Suspense fallback={&lt;div&gt;Loading...&lt;/div&gt;}&gt;
      &lt;OtherComponent /&gt;
    &lt;/Suspense&gt;
  );
}
The Suspense component will also allow library authors to start building data fetching with Suspense support in the future.

Note: This feature is not yet available for server-side rendering. Suspense support will be added in a later release.

static contextType
In React 16.3 we introduced the official Context API as a replacement to the previous Legacy Context API.
const MyContext = React.createContext();
We’ve heard feedback that adopting the new render prop API can be difficult in class components. So we’ve added a convenience API to consume a context value from within a class component.
class MyClass extends React.Component {
  static contextType = MyContext;
  componentDidMount() {
    let value = this.context;
    /* perform a side-effect at mount using the value of MyContext */
  }
  componentDidUpdate() {
    let value = this.context;
    /* ... */
  }
  componentWillUnmount() {
    let value = this.context;
    /* ... */
  }
  render() {
    let value = this.context;
    /* render something based on the value of MyContext */
  }
}
static getDerivedStateFromError()
React 16 introduced Error Boundaries for handling errors thrown in React renders. We already had the componentDidCatch lifecycle method which gets fired after an error has already happened. It’s great for logging errors to the server. It also lets you show a different UI to the user by calling setState.
Before that is fired, we render null in place of the tree that threw an error. This sometimes breaks parent components that don’t expect their refs to be empty. It also doesn’t work to recover from errors on the server since the Did lifecycle methods don’t fire during server-side rendering.
We’re adding another error method that lets you render the fallback UI before the render completes. See the docs for getDerivedStateFromError().

Note: getDerivedStateFromError() is not yet available for server-side rendering. It is designed to work with server-side rendering in a future release. We’re releasing it early so that you can start preparing to use it.

Deprecations in StrictMode
In 16.3 we introduced the StrictMode component. It lets you opt-in to early warnings for patterns that might cause problems in the future.
We’ve added two more APIs to the list of deprecated APIs in StrictMode. If you don’t use StrictMode you don’t have to worry; these warning won’t fire for you.

ReactDOM.findDOMNode() - This API is often misunderstood and most uses of it are unnecessary. It can also be surprisingly slow in React 16. See the docs for possible upgrade paths.
Legacy Context using contextTypes and getChildContext - Legacy context makes React slightly slower and bigger than it needs to be. That’s why we strongly want to encourage upgrading to the new context API. Hopefully the addition of the contextType API makes this a bit easier.

If you’re having trouble upgrading, we’d like to hear your feedback.
Installation
React v16.6.0 is available on the npm registry.
To install React 16 with Yarn, run:
yarn add react@^16.6.0 react-dom@^16.6.0
To install React 16 with npm, run:
npm install --save react@^16.6.0 react-dom@^16.6.0
We also provide UMD builds of React via a CDN:
&lt;script crossorigin src="https://unpkg.com/react@16/umd/react.production.min.js"&gt;&lt;/script&gt;
&lt;script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"&gt;&lt;/script&gt;
Refer to the documentation for detailed installation instructions.
Changelog
React

Add React.memo() as an alternative to PureComponent for functions. (@acdlite in #13748)
Add React.lazy() for code splitting components. (@acdlite in #13885)
React.StrictMode now warns about legacy context API. (@bvaughn in #13760)
React.StrictMode now warns about findDOMNode. (@sebmarkbage in #13841)
Rename unstable_AsyncMode to unstable_ConcurrentMode. (@trueadm in #13732)
Rename unstable_Placeholder to Suspense, and delayMs to maxDuration. (@gaearon in #13799 and @sebmarkbage in #13922)

React DOM

Add contextType as a more ergonomic way to subscribe to context from a class. (@bvaughn in #13728)
Add getDerivedStateFromError lifecycle method for catching errors in a future asynchronous server-side renderer. (@bvaughn in #13746)
Warn when &lt;Context&gt; is used instead of &lt;Context.Consumer&gt;. (@trueadm in #13829)
Fix gray overlay on iOS Safari. (@philipp-spiess in #13778)
Fix a bug caused by overwriting window.event in development. (@sergei-startsev in #13697)

React DOM Server

Add support for React.memo(). (@alexmckenley in #13855)
Add support for contextType. (@alexmckenley and @sebmarkbage in #13889)

Scheduler (Experimental)

Rename the package to scheduler. (@gaearon in #13683)
Support priority levels, continuations, and wrapped callbacks. (@acdlite in #13720 and #13842)
Improve the fallback mechanism in non-DOM environments. (@acdlite in #13740)
Schedule requestAnimationFrame earlier. (@acdlite in #13785)
Fix the DOM detection to be more thorough. (@trueadm in #13731)
Fix bugs with interaction tracing. (@bvaughn in #13590)
Add the envify transform to the package. (@mridgway in #13766)
', '<p>Today we’re releasing React 16.6 with a few new convenient features. A form of PureComponent/shouldComponentUpdate for function components, a way to do code splitting using Suspense and an easier way to consume Context from class components.</p>
<p>Check out the full <a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#changelog" rel="noopener noreferrer">changelog</a> below.</p>
<h2><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#reactmemo" rel="noopener noreferrer"></a><a href="https://reactjs.org/docs/react-api.html#reactmemo" rel="noopener noreferrer"><code>React.memo</code></a> </h2>
<p>Class components can bail out from rendering when their input props are the same using <a href="https://reactjs.org/docs/react-api.html#reactpurecomponent" rel="noopener noreferrer"><code>PureComponent</code></a> or <a href="https://reactjs.org/docs/react-component.html#shouldcomponentupdate" rel="noopener noreferrer"><code>shouldComponentUpdate</code></a>. Now you can do the same with function components by wrapping them in <a href="https://reactjs.org/docs/react-api.html#reactmemo" rel="noopener noreferrer"><code>React.memo</code></a>.</p>
<div><pre><code><span>const</span> MyComponent <span>=</span> React<span>.</span><span>memo</span><span>(</span><span>function</span> <span>MyComponent</span><span>(</span>props<span>)</span> <span>{</span>
  <span>/* only rerenders if props change */</span>
<span>}</span><span>)</span><span>;</span></code></pre></div>
<h2><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#reactlazy-code-splitting-with-suspense" rel="noopener noreferrer"></a><a href="https://reactjs.org/docs/code-splitting.html#reactlazy" rel="noopener noreferrer"><code>React.lazy</code></a>: Code-Splitting with <code>Suspense</code> </h2>
<p>You may have seen <a href="https://reactjs.org/blog/2018/03/01/sneak-peek-beyond-react-16.html" rel="noopener noreferrer">Dan’s talk about React Suspense at JSConf Iceland</a>. Now you can use the Suspense component to do <a href="https://reactjs.org/docs/code-splitting.html#reactlazy" rel="noopener noreferrer">code-splitting</a> by wrapping a dynamic import in a call to <code>React.lazy()</code>.</p>
<div><pre><code><span>import</span> React<span>,</span> <span>{</span>lazy<span>,</span> Suspense<span>}</span> <span>from</span> <span>''react''</span><span>;</span>
<span>const</span> OtherComponent <span>=</span> <span>lazy</span><span>(</span><span>(</span><span>)</span> <span>=&gt;</span> <span>import</span><span>(</span><span>''./OtherComponent''</span><span>)</span><span>)</span><span>;</span>

<span>function</span> <span>MyComponent</span><span>(</span><span>)</span> <span>{</span>
  <span>return</span> <span>(</span>
    <span><span><span>&lt;</span>Suspense</span> <span>fallback</span><span><span>=</span><span>{</span><span><span><span>&lt;</span>div</span><span>&gt;</span></span><span>Loading...</span><span><span><span>&lt;/</span>div</span><span>&gt;</span></span><span>}</span></span><span>&gt;</span></span><span>
      </span><span><span><span>&lt;</span>OtherComponent</span> <span>/&gt;</span></span><span>
    </span><span><span><span>&lt;/</span>Suspense</span><span>&gt;</span></span>
  <span>)</span><span>;</span>
<span>}</span></code></pre></div>
<p>The Suspense component will also allow library authors to start building data fetching with Suspense support in the future.</p>
<blockquote>
<p>Note: This feature is not yet available for server-side rendering. Suspense support will be added in a later release.</p>
</blockquote>
<h2><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#static-contexttype" rel="noopener noreferrer"></a><a href="https://reactjs.org/docs/context.html#classcontexttype" rel="noopener noreferrer"><code>static contextType</code></a> </h2>
<p>In <a href="https://reactjs.org/blog/2018/03/29/react-v-16-3.html" rel="noopener noreferrer">React 16.3</a> we introduced the official Context API as a replacement to the previous <a href="https://reactjs.org/docs/legacy-context.html" rel="noopener noreferrer">Legacy Context</a> API.</p>
<div><pre><code><span>const</span> MyContext <span>=</span> React<span>.</span><span>createContext</span><span>(</span><span>)</span><span>;</span></code></pre></div>
<p>We’ve heard feedback that adopting the new render prop API can be difficult in class components. So we’ve added a convenience API to <a href="https://reactjs.org/docs/context.html#classcontexttype" rel="noopener noreferrer">consume a context value from within a class component</a>.</p>
<div><pre><code><span>class</span> <span>MyClass</span> <span>extends</span> <span>React<span>.</span>Component</span> <span>{</span>
  <span>static</span> contextType <span>=</span> MyContext<span>;</span>
  <span>componentDidMount</span><span>(</span><span>)</span> <span>{</span>
    <span>let</span> value <span>=</span> <span>this</span><span>.</span>context<span>;</span>
    <span>/* perform a side-effect at mount using the value of MyContext */</span>
  <span>}</span>
  <span>componentDidUpdate</span><span>(</span><span>)</span> <span>{</span>
    <span>let</span> value <span>=</span> <span>this</span><span>.</span>context<span>;</span>
    <span>/* ... */</span>
  <span>}</span>
  <span>componentWillUnmount</span><span>(</span><span>)</span> <span>{</span>
    <span>let</span> value <span>=</span> <span>this</span><span>.</span>context<span>;</span>
    <span>/* ... */</span>
  <span>}</span>
  <span>render</span><span>(</span><span>)</span> <span>{</span>
    <span>let</span> value <span>=</span> <span>this</span><span>.</span>context<span>;</span>
    <span>/* render something based on the value of MyContext */</span>
  <span>}</span>
<span>}</span></code></pre></div>
<h2><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#static-getderivedstatefromerror" rel="noopener noreferrer"></a><a href="https://reactjs.org/docs/react-component.html#static-getderivedstatefromerror" rel="noopener noreferrer"><code>static getDerivedStateFromError()</code></a> </h2>
<p>React 16 introduced <a href="https://reactjs.org/blog/2017/07/26/error-handling-in-react-16.html" rel="noopener noreferrer">Error Boundaries</a> for handling errors thrown in React renders. We already had the <code>componentDidCatch</code> lifecycle method which gets fired after an error has already happened. It’s great for logging errors to the server. It also lets you show a different UI to the user by calling <code>setState</code>.</p>
<p>Before that is fired, we render <code>null</code> in place of the tree that threw an error. This sometimes breaks parent components that don’t expect their refs to be empty. It also doesn’t work to recover from errors on the server since the <code>Did</code> lifecycle methods don’t fire during server-side rendering.</p>
<p>We’re adding another error method that lets you render the fallback UI before the render completes. See the docs for <a href="https://reactjs.org/docs/react-component.html#static-getderivedstatefromerror" rel="noopener noreferrer"><code>getDerivedStateFromError()</code></a>.</p>
<blockquote>
<p>Note: <code>getDerivedStateFromError()</code> is not yet available for server-side rendering. It is designed to work with server-side rendering in a future release. We’re releasing it early so that you can start preparing to use it.</p>
</blockquote>
<h2><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#deprecations-in-strictmode" rel="noopener noreferrer"></a>Deprecations in StrictMode </h2>
<p>In <a href="https://reactjs.org/blog/2018/03/29/react-v-16-3.html#strictmode-component" rel="noopener noreferrer">16.3</a> we introduced the <a href="https://reactjs.org/docs/strict-mode.html" rel="noopener noreferrer"><code>StrictMode</code></a> component. It lets you opt-in to early warnings for patterns that might cause problems in the future.</p>
<p>We’ve added two more APIs to the list of deprecated APIs in <code>StrictMode</code>. If you don’t use <code>StrictMode</code> you don’t have to worry; these warning won’t fire for you.</p>
<ul>
<li><strong>ReactDOM.findDOMNode()</strong> - This API is often misunderstood and most uses of it are unnecessary. It can also be surprisingly slow in React 16. <a href="https://reactjs.org/docs/strict-mode.html#warning-about-deprecated-finddomnode-usage" rel="noopener noreferrer">See the docs</a> for possible upgrade paths.</li>
<li><strong>Legacy Context</strong> using contextTypes and getChildContext - Legacy context makes React slightly slower and bigger than it needs to be. That’s why we strongly want to encourage upgrading to the <a href="https://reactjs.org/docs/context.html" rel="noopener noreferrer">new context API</a>. Hopefully the addition of the <a href="https://reactjs.org/docs/context.html#classcontexttype" rel="noopener noreferrer"><code>contextType</code></a> API makes this a bit easier.</li>
</ul>
<p>If you’re having trouble upgrading, we’d like to hear your feedback.</p>
<h2><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#installation" rel="noopener noreferrer"></a>Installation </h2>
<p>React v16.6.0 is available on the npm registry.</p>
<p>To install React 16 with Yarn, run:</p>
<div><pre><code>yarn add react@^16.6.0 react-dom@^16.6.0</code></pre></div>
<p>To install React 16 with npm, run:</p>
<div><pre><code><span>npm</span> <span>install</span> --save react@^16.6.0 react-dom@^16.6.0</code></pre></div>
<p>We also provide UMD builds of React via a CDN:</p>
<div><pre><code><span><span><span>&lt;</span>script</span> <span>crossorigin</span> <span>src</span><span><span>=</span><span>"</span>https://unpkg.com/react@16/umd/react.production.min.js<span>"</span></span><span>&gt;</span></span><span></span><span><span><span>&lt;/</span>script</span><span>&gt;</span></span>
<span><span><span>&lt;</span>script</span> <span>crossorigin</span> <span>src</span><span><span>=</span><span>"</span>https://unpkg.com/react-dom@16/umd/react-dom.production.min.js<span>"</span></span><span>&gt;</span></span><span></span><span><span><span>&lt;/</span>script</span><span>&gt;</span></span></code></pre></div>
<p>Refer to the documentation for <a href="https://reactjs.org/docs/installation.html" rel="noopener noreferrer">detailed installation instructions</a>.</p>
<h2><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#changelog" rel="noopener noreferrer"></a>Changelog </h2>
<h3><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#react" rel="noopener noreferrer"></a>React </h3>
<ul>
<li>Add <code>React.memo()</code> as an alternative to <code>PureComponent</code> for functions. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/13748" rel="noopener noreferrer">#13748</a>)</li>
<li>Add <code>React.lazy()</code> for code splitting components. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/13885" rel="noopener noreferrer">#13885</a>)</li>
<li><code>React.StrictMode</code> now warns about legacy context API. (<a href="https://github.com/bvaughn" rel="noopener noreferrer">@bvaughn</a> in <a href="https://github.com/facebook/react/pull/13760" rel="noopener noreferrer">#13760</a>)</li>
<li><code>React.StrictMode</code> now warns about <code>findDOMNode</code>. (<a href="https://github.com/sebmarkbage" rel="noopener noreferrer">@sebmarkbage</a> in <a href="https://github.com/facebook/react/pull/13841" rel="noopener noreferrer">#13841</a>)</li>
<li>Rename <code>unstable_AsyncMode</code> to <code>unstable_ConcurrentMode</code>. (<a href="https://github.com/trueadm" rel="noopener noreferrer">@trueadm</a> in <a href="https://github.com/facebook/react/pull/13732" rel="noopener noreferrer">#13732</a>)</li>
<li>Rename <code>unstable_Placeholder</code> to <code>Suspense</code>, and <code>delayMs</code> to <code>maxDuration</code>. (<a href="https://github.com/gaearon" rel="noopener noreferrer">@gaearon</a> in <a href="https://github.com/facebook/react/pull/13799" rel="noopener noreferrer">#13799</a> and <a href="https://github.com/sebmarkbage" rel="noopener noreferrer">@sebmarkbage</a> in <a href="https://github.com/facebook/react/pull/13922" rel="noopener noreferrer">#13922</a>)</li>
</ul>
<h3><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#react-dom" rel="noopener noreferrer"></a>React DOM </h3>
<ul>
<li>Add <code>contextType</code> as a more ergonomic way to subscribe to context from a class. (<a href="https://github.com/bvaughn" rel="noopener noreferrer">@bvaughn</a> in <a href="https://github.com/facebook/react/pull/13728" rel="noopener noreferrer">#13728</a>)</li>
<li>Add <code>getDerivedStateFromError</code> lifecycle method for catching errors in a future asynchronous server-side renderer. (<a href="https://github.com/bvaughn" rel="noopener noreferrer">@bvaughn</a> in <a href="https://github.com/facebook/react/pull/13746" rel="noopener noreferrer">#13746</a>)</li>
<li>Warn when <code>&lt;Context&gt;</code> is used instead of <code>&lt;Context.Consumer&gt;</code>. (<a href="https://github.com/trueadm" rel="noopener noreferrer">@trueadm</a> in <a href="https://github.com/facebook/react/pull/13829" rel="noopener noreferrer">#13829</a>)</li>
<li>Fix gray overlay on iOS Safari. (<a href="https://github.com/philipp-spiess" rel="noopener noreferrer">@philipp-spiess</a> in <a href="https://github.com/facebook/react/pull/13778" rel="noopener noreferrer">#13778</a>)</li>
<li>Fix a bug caused by overwriting <code>window.event</code> in development. (<a href="https://github.com/sergei-startsev" rel="noopener noreferrer">@sergei-startsev</a> in <a href="https://github.com/facebook/react/pull/13697" rel="noopener noreferrer">#13697</a>)</li>
</ul>
<h3><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#react-dom-server" rel="noopener noreferrer"></a>React DOM Server </h3>
<ul>
<li>Add support for <code>React.memo()</code>. (<a href="https://github.com/alexmckenley" rel="noopener noreferrer">@alexmckenley</a> in <a href="https://github.com/facebook/react/pull/13855" rel="noopener noreferrer">#13855</a>)</li>
<li>Add support for <code>contextType</code>. (<a href="https://github.com/alexmckenley" rel="noopener noreferrer">@alexmckenley</a> and <a href="https://github.com/sebmarkbage" rel="noopener noreferrer">@sebmarkbage</a> in <a href="https://github.com/facebook/react/pull/13889" rel="noopener noreferrer">#13889</a>)</li>
</ul>
<h3><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html#scheduler-experimental" rel="noopener noreferrer"></a>Scheduler (Experimental) </h3>
<ul>
<li>Rename the package to <code>scheduler</code>. (<a href="https://github.com/gaearon" rel="noopener noreferrer">@gaearon</a> in <a href="https://github.com/facebook/react/pull/13683" rel="noopener noreferrer">#13683</a>)</li>
<li>Support priority levels, continuations, and wrapped callbacks. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/13720" rel="noopener noreferrer">#13720</a> and <a href="https://github.com/facebook/react/pull/13842" rel="noopener noreferrer">#13842</a>)</li>
<li>Improve the fallback mechanism in non-DOM environments. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/13740" rel="noopener noreferrer">#13740</a>)</li>
<li>Schedule <code>requestAnimationFrame</code> earlier. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/13785" rel="noopener noreferrer">#13785</a>)</li>
<li>Fix the DOM detection to be more thorough. (<a href="https://github.com/trueadm" rel="noopener noreferrer">@trueadm</a> in <a href="https://github.com/facebook/react/pull/13731" rel="noopener noreferrer">#13731</a>)</li>
<li>Fix bugs with interaction tracing. (<a href="https://github.com/bvaughn" rel="noopener noreferrer">@bvaughn</a> in <a href="https://github.com/facebook/react/pull/13590" rel="noopener noreferrer">#13590</a>)</li>
<li>Add the <code>envify</code> transform to the package. (<a href="https://github.com/mridgway" rel="noopener noreferrer">@mridgway</a> in <a href="https://github.com/facebook/react/pull/13766" rel="noopener noreferrer">#13766</a>)</li>
</ul>', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (56, 4, 'https://reactjs.org/blog/2018/11/13/react-conf-recap.html', 'React Conf recap: Hooks, Suspense, and Concurrent Rendering', '2018-11-13T00:00:00+00:00', 'This year’s React Conf took place on October 25 and 26 in Henderson, Nevada, where more than 600 attendees gathered to discuss the latest in UI engineering.






Sophie Alpert and Dan Abramov kicked off Day 1 with their keynote, React Today and Tomorrow. In the talk, they introduced Hooks, which are a new proposal that adds the ability to access features such as state without writing a JavaScript class. Hooks promise to dramatically simplify the code required for React components and are currently available in a React alpha release.






On the morning of Day 2, Andrew Clark and Brian Vaughn presented Concurrent Rendering in React. Andrew covered the recently announced React.lazy API for code splitting and previewed two upcoming features: concurrent mode and Suspense. Brian demonstrated how to use React’s new profiler tooling to make apps built in React run faster.






In the afternoon, Parashuram N spoke in detail about React Native’s New Architecture, a long-term project that the React Native team has been working on over the past year and announced in June. We’re really excited about the potential of this project to improve performance, simplify interoperability with other libraries, and set a strong foundation for the future of React Native.
Now that the conference is over, all 28 conference talks are available to stream online. There are tons of great ones from both days. We can’t wait until next year!', '<p>This year’s <a href="https://conf.reactjs.org/" rel="noopener noreferrer">React Conf</a> took place on October 25 and 26 in Henderson, Nevada, where more than 600 attendees gathered to discuss the latest in UI engineering.</p>
<br>
<div>
          <div>

          </div>
          </div>
<p>Sophie Alpert and Dan Abramov kicked off Day 1 with their keynote, React Today and Tomorrow. In the talk, they introduced <a href="https://reactjs.org/docs/hooks-intro.html" rel="noopener noreferrer">Hooks</a>, which are a new proposal that adds the ability to access features such as state without writing a JavaScript class. Hooks promise to dramatically simplify the code required for React components and are currently available in a React alpha release.</p>
<br>
<div>
          <div>

          </div>
          </div>
<p>On the morning of Day 2, Andrew Clark and Brian Vaughn presented Concurrent Rendering in React. Andrew covered the recently announced <a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html" rel="noopener noreferrer">React.lazy API for code splitting</a> and previewed two upcoming features: concurrent mode and Suspense. Brian demonstrated how to use <a href="https://reactjs.org/blog/2018/09/10/introducing-the-react-profiler.html" rel="noopener noreferrer">React’s new profiler</a> tooling to make apps built in React run faster.</p>
<br>
<div>
          <div>

          </div>
          </div>
<p>In the afternoon, Parashuram N spoke in detail about React Native’s New Architecture, a long-term project that the React Native team has been working on over the past year and <a href="https://facebook.github.io/react-native/blog/2018/06/14/state-of-react-native-2018" rel="noopener noreferrer">announced in June</a>. We’re really excited about the potential of this project to improve performance, simplify interoperability with other libraries, and set a strong foundation for the future of React Native.</p>
<p>Now that the conference is over, all 28 conference talks are <a href="https://www.youtube.com/playlist?list=PLPxbbTqCLbGE5AihOSExAa4wUM-P42EIJ" rel="noopener noreferrer">available to stream online</a>. There are tons of great ones from both days. We can’t wait until next year!</p>', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (57, 4, 'https://reactjs.org/blog/2018/11/27/react-16-roadmap.html', 'React 16.x Roadmap', '2018-11-27T00:00:00+00:00', 'You might have heard about features like “Hooks”, “Suspense”, and “Concurrent Rendering” in the previous blog posts and talks. In this post, we’ll look at how they fit together and the expected timeline for their availability in a stable release of React.

An Update from August, 2019
You can find an update to this roadmap in the React 16.9 release blog post.

tl;dr
We plan to split the rollout of new React features into the following milestones:

React 16.6 with Suspense for Code Splitting (already shipped)
A minor 16.x release with React Hooks (~Q1 2019)
A minor 16.x release with Concurrent Mode (~Q2 2019)
A minor 16.x release with Suspense for Data Fetching (~mid 2019)

(The original version of this post used exact version numbers. We edited it to reflect that there might need to be a few other minor releases in the middle between these ones.)
These are estimates, and the details may change as we’re further along. There’s at least two more projects we plan to complete in 2019. They require more exploration and aren’t tied to a particular release yet:

Modernizing React DOM
Suspense for Server Rendering

We expect to get more clarity on their timeline in the coming months.

Note
This post is just a roadmap — there is nothing in it that requires your immediate attention. When each of these features are released, we’ll publish a full blog post announcing them.

Release Timeline
We have a single vision for how all of these features fit together, but we’re releasing each part as soon as it is ready so that you can test and start using them sooner. The API design doesn’t always make sense when looking at one piece in isolation; this post lays out the major parts of our plan to help you see the whole picture. (See our versioning policy to learn more about our commitment to stability.)
The gradual release strategy helps us refine the APIs, but the transitional period when some things aren’t ready can be confusing. Let’s look at what these different features mean for your app, how they relate to each other, and when you can expect to start learning and using them.
React 16.6 (shipped): The One with Suspense for Code Splitting
Suspense refers to React’s new ability to “suspend” rendering while components are waiting for something, and display a loading indicator. In React 16.6, Suspense supports only one use case: lazy loading components with React.lazy() and &lt;React.Suspense&gt;.
// This component is loaded dynamically
const OtherComponent = React.lazy(() =&gt; import(''./OtherComponent''));

function MyComponent() {
  return (
    &lt;React.Suspense fallback={&lt;Spinner /&gt;}&gt;
      &lt;div&gt;
        &lt;OtherComponent /&gt;
      &lt;/div&gt;
    &lt;/React.Suspense&gt;
  );
}
Code splitting with React.lazy() with &lt;React.Suspense&gt; is documented in the Code Splitting guide. You can find another practical explanation in this article.
We have been using Suspense for code splitting at Facebook since July, and expect it to be stable. There’s been a few regressions in the initial public release in 16.6.0, but they were fixed in 16.6.3.
Code splitting is just the first step for Suspense. Our longer term vision for Suspense involves letting it handle data fetching too (and integrate with libraries like Apollo). In addition to a convenient programming model, Suspense also provides better user experience in Concurrent Mode. You’ll find information about these topics further below.
Status in React DOM: Available since React 16.6.0.
Status in React DOM Server: Suspense is not available in the server renderer yet. This isn’t for the lack of attention. We’ve started work on a new asynchronous server renderer that will support Suspense, but it’s a large project and will take a good chunk of 2019 to complete.
Status in React Native: Bundle splitting isn’t very useful in React Native, but there’s nothing technically preventing React.lazy() and &lt;Suspense&gt; from working when given a Promise to a module.
Recommendation: If you only do client rendering, we recommend widely adopting React.lazy() and &lt;React.Suspense&gt; for code splitting React components. If you do server rendering, you’ll have to wait with adoption until the new server renderer is ready.
React 16.x (~Q1 2019): The One with Hooks
Hooks let you use features like state and lifecycle from function components. They also let you reuse stateful logic between components without introducing extra nesting in your tree.
function Example() {
  // Declare a new state variable, which we''ll call "count"
  const [count, setCount] = useState(0);

  return (
   &lt;div&gt;
     &lt;p&gt;You clicked {count} times&lt;/p&gt;
     &lt;button onClick={() =&gt; setCount(count + 1)}&gt;
       Click me
     &lt;/button&gt;
   &lt;/div&gt;
 );
}
Hooks introduction and overview are good places to start. Watch these talks for a video introduction and a deep dive. The FAQ should answer most of your further questions. To learn more about the motivation behind Hooks, you can read this article. Some of the rationale for the API design of Hooks is explained in this RFC thread reply.
We have been dogfooding Hooks at Facebook since September. We don’t expect major bugs in the implementation. Hooks are only available in the 16.7 alpha versions of React. Some of their API is expected to change in the final version (see the end of this comment for details). It is possible that the minor release with Hooks might not be React 16.7.
Hooks represent our vision for the future of React. They solve both problems that React users experience directly (“wrapper hell” of render props and higher-order components, duplication of logic in lifecycle methods), and the issues we’ve encountered optimizing React at scale (such as difficulties in inlining components with a compiler). Hooks don’t deprecate classes. However, if Hooks are successful, it is possible that in a future major release class support might move to a separate package, reducing the default bundle size of React.
Status in React DOM: The first version of react and react-dom supporting Hooks is 16.7.0-alpha.0. We expect to publish more alphas over the next months (at the time of writing, the latest one is 16.7.0-alpha.2). You can try them by installing react@next with react-dom@next. Don’t forget to update react-dom — otherwise Hooks won’t work.
Status in React DOM Server: The same 16.7 alpha versions of react-dom fully support Hooks with react-dom/server.
Status in React Native: There is no officially supported way to try Hooks in React Native yet. If you’re feeling adventurous, check out this thread for unofficial instructions. There is a known issue with useEffect firing too late which still needs to be solved.
Recommendation: When you’re ready, we encourage you to start trying Hooks in new components you write. Make sure everyone on your team is on board with using them and familiar with this documentation. We don’t recommend rewriting your existing classes to Hooks unless you planned to rewrite them anyway (e.g. to fix bugs). Read more about the adoption strategy here.
React 16.x (~Q2 2019): The One with Concurrent Mode
Concurrent Mode lets React apps be more responsive by rendering component trees without blocking the main thread. It is opt-in and allows React to interrupt a long-running render (for example, rendering a new feed story) to handle a high-priority event (for example, text input or hover). Concurrent Mode also improves the user experience of Suspense by skipping unnecessary loading states on fast connections.

Note
You might have previously heard Concurrent Mode being referred to as “async mode”. We’ve changed the name to Concurrent Mode to highlight React’s ability to perform work on different priority levels. This sets it apart from other approaches to async rendering.

// Two ways to opt in:

// 1. Part of an app (not final API)
&lt;React.unstable_ConcurrentMode&gt;
  &lt;Something /&gt;
&lt;/React.unstable_ConcurrentMode&gt;

// 2. Whole app (not final API)
ReactDOM.unstable_createRoot(domNode).render(&lt;App /&gt;);
There is no documentation written for the Concurrent Mode yet. It is important to highlight that the conceptual model will likely be unfamiliar at first. Documenting its benefits, how to use it efficiently, and its pitfalls is a high priority for us, and will be a prerequisite for calling it stable. Until then, Andrew’s talk is the best introduction available.
Concurrent Mode is much less polished than Hooks. Some APIs aren’t properly “wired up” yet and don’t do what they’re expected to. At the time of writing this post, we don’t recommend using it for anything except very early experimentation. We don’t expect many bugs in Concurrent Mode itself, but note that components that produce warnings in &lt;React.StrictMode&gt; may not work correctly. On a separate note, we’ve seen that Concurrent Mode surfaces performance problems in other code which can sometimes be mistaken for performance issues in Concurrent Mode itself. For example, a stray setInterval(fn, 1) call that runs every millisecond would have a worse effect in Concurrent Mode. We plan to publish more guidance about diagnosing and fixing issues like this as part of this release’s documentation.
Concurrent Mode is a big part of our vision for React. For CPU-bound work, it allows non-blocking rendering and keeps your app responsive while rendering complex component trees. That’s demoed in the first part of our JSConf Iceland talk. Concurrent Mode also makes Suspense better. It lets you avoid flickering a loading indicator if the network is fast enough. It’s hard to explain without seeing so Andrew’s talk is the best resource available today. Concurrent Mode relies on a cooperative main thread scheduler, and we are collaborating with the Chrome team to eventually move this functionality into the browser itself.
Status in React DOM: A very unstable version of Concurrent Mode is available behind an unstable_ prefix in React 16.6 but we don’t recommend trying it unless you’re willing to often run into walls or missing features. The 16.7 alphas include React.ConcurrentMode and ReactDOM.createRoot without an unstable_ prefix, but we’ll likely keep the prefix in 16.7, and only document and mark Concurrent Mode as stable in this future minor release.
Status in React DOM Server: Concurrent Mode doesn’t directly affect server rendering. It will work with the existing server renderer.
Status in React Native: The current plan is to delay enabling Concurrent Mode in React Native until React Fabric project is near completion.
Recommendation: If you wish to adopt Concurrent Mode in the future, wrapping some component subtrees in &lt;React.StrictMode&gt; and fixing the resulting warnings is a good first step. In general it’s not expected that legacy code would immediately be compatible. For example, at Facebook we mostly intend to use the Concurrent Mode in the more recently developed codebases, and keep the legacy ones running in the synchronous mode for the near future.
React 16.x (~mid 2019): The One with Suspense for Data Fetching
As mentioned earlier, Suspense refers to React’s ability to “suspend” rendering while components are waiting for something, and display a loading indicator. In the already shipped React 16.6, the only supported use case for Suspense is code splitting. In this future minor release, we’d like to provide officially supported ways to use it for data fetching too. We’ll provide a reference implementation of a basic “React Cache” that’s compatible with Suspense, but you can also write your own. Data fetching libraries like Apollo and Relay will be able to integrate with Suspense by following a simple specification that we’ll document.
// React Cache for simple data fetching (not final API)
import {unstable_createResource} from ''react-cache'';

// Tell React Cache how to fetch your data
const TodoResource = unstable_createResource(fetchTodo);

function Todo(props) {
  // Suspends until the data is in the cache
  const todo = TodoResource.read(props.id);
  return &lt;li&gt;{todo.title}&lt;/li&gt;;
}

function App() {
  return (
    // Same Suspense component you already use for code splitting
    // would be able to handle data fetching too.
    &lt;React.Suspense fallback={&lt;Spinner /&gt;}&gt;
      &lt;ul&gt;
        {/* Siblings fetch in parallel */}
        &lt;Todo id="1" /&gt;
        &lt;Todo id="2" /&gt;
      &lt;/ul&gt;
    &lt;/React.Suspense&gt;
  );
}

// Other libraries like Apollo and Relay can also
// provide Suspense integrations with similar APIs.
There is no official documentation for how to fetch data with Suspense yet, but you can find some early information in this talk and this small demo. We’ll write documentation for React Cache (and how to write your own Suspense-compatible library) closer to this React release, but if you’re curious, you can find its very early source code here.
The low-level Suspense mechanism (suspending rendering and showing a fallback) is expected to be stable even in React 16.6. We’ve used it for code splitting in production for months. However, the higher-level APIs for data fetching are very unstable. React Cache is rapidly changing, and will change at least a few more times. There are some low-level APIs that are missing for a good higher-level API to be possible. We don’t recommend using React Cache anywhere except very early experiments. Note that React Cache itself isn’t strictly tied to React releases, but the current alphas lack basic features as cache invalidation, and you’ll run into a wall very soon. We expect to have something usable with this React release.
Eventually we’d like most data fetching to happen through Suspense but it will take a long time until all integrations are ready. In practice we expect it to be adopted very incrementally, and often through layers like Apollo or Relay rather than directly. Missing higher level APIs aren’t the only obstacle — there are also some important UI patterns we don’t support yet such as showing progress indicator outside of the loading view hierarchy. As always, we will communicate our progress in the release notes on this blog.
Status in React DOM and React Native: Technically, a compatible cache would already work with &lt;React.Suspense&gt; in React 16.6. However, we don’t expect to have a good cache implementation until this React minor release. If you’re feeling adventurous, you can try to write your own cache by looking at the React Cache alphas. However, note that the mental model is sufficiently different that there’s a high risk of misunderstanding it until the docs are ready.
Status in React DOM Server: Suspense is not available in the server renderer yet. As we mentioned earlier, we’ve started work on a new asynchronous server renderer that will support Suspense, but it’s a large project and will take a good chunk of 2019 to complete.
Recommendation: Wait for this minor React release in order to use Suspense for data fetching. Don’t try to use Suspense features in 16.6 for it; it’s not supported. However, your existing &lt;Suspense&gt; components for code splitting will be able to show loading states for data too when Suspense for Data Fetching becomes officially supported.
Other Projects
Modernizing React DOM
We started an investigation into simplifying and modernizing ReactDOM, with a goal of reduced bundle size and aligning closer with the browser behavior. It is still early to say which specific bullet points will “make it” because the project is in an exploratory phase. We will communicate our progress on that issue.
Suspense for Server Rendering
We started designing a new server renderer that supports Suspense (including waiting for asynchronous data on the server without double rendering) and progressively loading and hydrating page content in chunks for best user experience. You can watch an overview of its early prototype in this talk. The new server renderer is going to be our major focus in 2019, but it’s too early to say anything about its release schedule. Its development, as always, will happen on GitHub.

And that’s about it! As you can see, there’s a lot here to keep us busy but we expect much progress in the coming months.
We hope this post gives you an idea of what we’re working on, what you can use today, and what you can expect to use in the future. While there’s a lot of discussion about new features on social media platforms, you won’t miss anything important if you read this blog.
We’re always open to feedback, and love to hear from you in the RFC repository, the issue tracker, and on Twitter.', '<p>You might have heard about features like “Hooks”, “Suspense”, and “Concurrent Rendering” in the previous blog posts and talks. In this post, we’ll look at how they fit together and the expected timeline for their availability in a stable release of React.</p>
<blockquote>
<p>An Update from August, 2019</p>
<p>You can find an update to this roadmap in the <a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#an-update-to-the-roadmap" rel="noopener noreferrer">React 16.9 release blog post</a>.</p>
</blockquote>
<h2><a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#tldr" rel="noopener noreferrer"></a>tl;dr </h2>
<p>We plan to split the rollout of new React features into the following milestones:</p>
<ul>
<li>React 16.6 with <a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#react-166-shipped-the-one-with-suspense-for-code-splitting" rel="noopener noreferrer">Suspense for Code Splitting</a> (<em>already shipped</em>)</li>
<li>A minor 16.x release with <a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#react-16x-q1-2019-the-one-with-hooks" rel="noopener noreferrer">React Hooks</a> (~Q1 2019)</li>
<li>A minor 16.x release with <a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#react-16x-q2-2019-the-one-with-concurrent-mode" rel="noopener noreferrer">Concurrent Mode</a> (~Q2 2019)</li>
<li>A minor 16.x release with <a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#react-16x-mid-2019-the-one-with-suspense-for-data-fetching" rel="noopener noreferrer">Suspense for Data Fetching</a> (~mid 2019)</li>
</ul>
<p><em>(The original version of this post used exact version numbers. We edited it to reflect that there might need to be a few other minor releases in the middle between these ones.)</em></p>
<p>These are estimates, and the details may change as we’re further along. There’s at least two more projects we plan to complete in 2019. They require more exploration and aren’t tied to a particular release yet:</p>
<ul>
<li><a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#modernizing-react-dom" rel="noopener noreferrer">Modernizing React DOM</a></li>
<li><a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#suspense-for-server-rendering" rel="noopener noreferrer">Suspense for Server Rendering</a></li>
</ul>
<p>We expect to get more clarity on their timeline in the coming months.</p>
<blockquote>
<p>Note</p>
<p>This post is just a roadmap — there is nothing in it that requires your immediate attention. When each of these features are released, we’ll publish a full blog post announcing them.</p>
</blockquote>
<h2><a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#release-timeline" rel="noopener noreferrer"></a>Release Timeline </h2>
<p>We have a single vision for how all of these features fit together, but we’re releasing each part as soon as it is ready so that you can test and start using them sooner. The API design doesn’t always make sense when looking at one piece in isolation; this post lays out the major parts of our plan to help you see the whole picture. (See our <a href="https://reactjs.org/docs/faq-versioning.html" rel="noopener noreferrer">versioning policy</a> to learn more about our commitment to stability.)</p>
<p>The gradual release strategy helps us refine the APIs, but the transitional period when some things aren’t ready can be confusing. Let’s look at what these different features mean for your app, how they relate to each other, and when you can expect to start learning and using them.</p>
<h3><a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#react-166-shipped-the-one-with-suspense-for-code-splitting" rel="noopener noreferrer"></a><a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html" rel="noopener noreferrer">React 16.6</a> (shipped): The One with Suspense for Code Splitting </h3>
<p><em>Suspense</em> refers to React’s new ability to “suspend” rendering while components are waiting for something, and display a loading indicator. In React 16.6, Suspense supports only one use case: lazy loading components with <code>React.lazy()</code> and <code>&lt;React.Suspense&gt;</code>.</p>
<div><pre><code><span>// This component is loaded dynamically</span>
<span>const</span> OtherComponent <span>=</span> React<span>.</span><span>lazy</span><span>(</span><span>(</span><span>)</span> <span>=&gt;</span> <span>import</span><span>(</span><span>''./OtherComponent''</span><span>)</span><span>)</span><span>;</span>

<span>function</span> <span>MyComponent</span><span>(</span><span>)</span> <span>{</span>
  <span>return</span> <span>(</span>
    <span><span><span>&lt;</span>React.Suspense</span> <span>fallback</span><span><span>=</span><span>{</span><span><span><span>&lt;</span>Spinner</span> <span>/&gt;</span></span><span>}</span></span><span>&gt;</span></span><span>
      </span><span><span><span>&lt;</span>div</span><span>&gt;</span></span><span>
        </span><span><span><span>&lt;</span>OtherComponent</span> <span>/&gt;</span></span><span>
      </span><span><span><span>&lt;/</span>div</span><span>&gt;</span></span><span>
    </span><span><span><span>&lt;/</span>React.Suspense</span><span>&gt;</span></span>
  <span>)</span><span>;</span>
<span>}</span></code></pre></div>
<p>Code splitting with <code>React.lazy()</code> with <code>&lt;React.Suspense&gt;</code> is documented <a href="https://reactjs.org/docs/code-splitting.html#reactlazy" rel="noopener noreferrer">in the Code Splitting guide</a>. You can find another practical explanation in <a href="https://medium.com/@pomber/lazy-loading-and-preloading-components-in-react-16-6-804de091c82d" rel="noopener noreferrer">this article</a>.</p>
<p>We have been using Suspense for code splitting at Facebook since July, and expect it to be stable. There’s been a few regressions in the initial public release in 16.6.0, but they were fixed in 16.6.3.</p>
<p>Code splitting is just the first step for Suspense. Our longer term vision for Suspense involves letting it handle data fetching too (and integrate with libraries like Apollo). In addition to a convenient programming model, Suspense also provides better user experience in Concurrent Mode. You’ll find information about these topics further below.</p>
<p><strong>Status in React DOM:</strong> Available since React 16.6.0.</p>
<p><strong>Status in React DOM Server:</strong> Suspense is not available in the server renderer yet. This isn’t for the lack of attention. We’ve started work on a new asynchronous server renderer that will support Suspense, but it’s a large project and will take a good chunk of 2019 to complete.</p>
<p><strong>Status in React Native:</strong> Bundle splitting isn’t very useful in React Native, but there’s nothing technically preventing <code>React.lazy()</code> and <code>&lt;Suspense&gt;</code> from working when given a Promise to a module.</p>
<p><strong>Recommendation:</strong> If you only do client rendering, we recommend widely adopting <code>React.lazy()</code> and <code>&lt;React.Suspense&gt;</code> for code splitting React components. If you do server rendering, you’ll have to wait with adoption until the new server renderer is ready.</p>
<h3><a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#react-16x-q1-2019-the-one-with-hooks" rel="noopener noreferrer"></a>React 16.x (~Q1 2019): The One with Hooks </h3>
<p><em>Hooks</em> let you use features like state and lifecycle from function components. They also let you reuse stateful logic between components without introducing extra nesting in your tree.</p>
<div><pre><code><span>function</span> <span>Example</span><span>(</span><span>)</span> <span>{</span>
  <span>// Declare a new state variable, which we''ll call "count"</span>
  <span>const</span> <span>[</span>count<span>,</span> setCount<span>]</span> <span>=</span> <span>useState</span><span>(</span><span>0</span><span>)</span><span>;</span>

  <span>return</span> <span>(</span>
   <span><span><span>&lt;</span>div</span><span>&gt;</span></span><span>
     </span><span><span><span>&lt;</span>p</span><span>&gt;</span></span><span>You clicked </span><span>{</span>count<span>}</span><span> times</span><span><span><span>&lt;/</span>p</span><span>&gt;</span></span><span>
     </span><span><span><span>&lt;</span>button</span> <span>onClick</span><span><span>=</span><span>{</span><span>(</span><span>)</span> <span>=&gt;</span> <span>setCount</span><span>(</span>count <span>+</span> <span>1</span><span>)</span><span>}</span></span><span>&gt;</span></span><span>
       Click me
     </span><span><span><span>&lt;/</span>button</span><span>&gt;</span></span><span>
   </span><span><span><span>&lt;/</span>div</span><span>&gt;</span></span>
 <span>)</span><span>;</span>
<span>}</span></code></pre></div>
<p>Hooks <a href="https://reactjs.org/docs/hooks-intro.html" rel="noopener noreferrer">introduction</a> and <a href="https://reactjs.org/docs/hooks-overview.html" rel="noopener noreferrer">overview</a> are good places to start. Watch <a href="https://www.youtube.com/watch?v=V-QO-KO90iQ" rel="noopener noreferrer">these talks</a> for a video introduction and a deep dive. The <a href="https://reactjs.org/docs/hooks-faq.html" rel="noopener noreferrer">FAQ</a> should answer most of your further questions. To learn more about the motivation behind Hooks, you can read <a href="https://medium.com/@dan_abramov/making-sense-of-react-hooks-fdbde8803889" rel="noopener noreferrer">this article</a>. Some of the rationale for the API design of Hooks is explained in <a href="https://github.com/reactjs/rfcs/pull/68#issuecomment-439314884" rel="noopener noreferrer">this RFC thread reply</a>.</p>
<p>We have been dogfooding Hooks at Facebook since September. We don’t expect major bugs in the implementation. Hooks are only available in the 16.7 alpha versions of React. Some of their API is expected to change in the final version (see the end of <a href="https://github.com/reactjs/rfcs/pull/68#issuecomment-439314884" rel="noopener noreferrer">this comment</a> for details). It is possible that the minor release with Hooks might not be React 16.7.</p>
<p>Hooks represent our vision for the future of React. They solve both problems that React users experience directly (“wrapper hell” of render props and higher-order components, duplication of logic in lifecycle methods), and the issues we’ve encountered optimizing React at scale (such as difficulties in inlining components with a compiler). Hooks don’t deprecate classes. However, if Hooks are successful, it is possible that in a future <em>major</em> release class support might move to a separate package, reducing the default bundle size of React.</p>
<p><strong>Status in React DOM:</strong> The first version of <code>react</code> and <code>react-dom</code> supporting Hooks is <code>16.7.0-alpha.0</code>. We expect to publish more alphas over the next months (at the time of writing, the latest one is <code>16.7.0-alpha.2</code>). You can try them by installing <code>react@next</code> with <code>react-dom@next</code>. Don’t forget to update <code>react-dom</code> — otherwise Hooks won’t work.</p>
<p><strong>Status in React DOM Server:</strong> The same 16.7 alpha versions of <code>react-dom</code> fully support Hooks with <code>react-dom/server</code>.</p>
<p><strong>Status in React Native:</strong> There is no officially supported way to try Hooks in React Native yet. If you’re feeling adventurous, check out <a href="https://github.com/facebook/react-native/issues/21967" rel="noopener noreferrer">this thread</a> for unofficial instructions. There is a known issue with <code>useEffect</code> firing too late which still needs to be solved.</p>
<p><strong>Recommendation:</strong> When you’re ready, we encourage you to start trying Hooks in new components you write. Make sure everyone on your team is on board with using them and familiar with this documentation. We don’t recommend rewriting your existing classes to Hooks unless you planned to rewrite them anyway (e.g. to fix bugs). Read more about the adoption strategy <a href="https://reactjs.org/docs/hooks-faq.html#adoption-strategy" rel="noopener noreferrer">here</a>.</p>
<h3><a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#react-16x-q2-2019-the-one-with-concurrent-mode" rel="noopener noreferrer"></a>React 16.x (~Q2 2019): The One with Concurrent Mode </h3>
<p><em>Concurrent Mode</em> lets React apps be more responsive by rendering component trees without blocking the main thread. It is opt-in and allows React to interrupt a long-running render (for example, rendering a new feed story) to handle a high-priority event (for example, text input or hover). Concurrent Mode also improves the user experience of Suspense by skipping unnecessary loading states on fast connections.</p>
<blockquote>
<p>Note</p>
<p>You might have previously heard Concurrent Mode being referred to as <a href="https://reactjs.org/blog/2018/03/27/update-on-async-rendering.html" rel="noopener noreferrer">“async mode”</a>. We’ve changed the name to Concurrent Mode to highlight React’s ability to perform work on different priority levels. This sets it apart from other approaches to async rendering.</p>
</blockquote>
<div><pre><code><span>// Two ways to opt in:</span>

<span>// 1. Part of an app (not final API)</span>
<span><span><span>&lt;</span>React.unstable_ConcurrentMode</span><span>&gt;</span></span><span>
  </span><span><span><span>&lt;</span>Something</span> <span>/&gt;</span></span><span>
</span><span><span><span>&lt;/</span>React.unstable_ConcurrentMode</span><span>&gt;</span></span>

<span>// 2. Whole app (not final API)</span>
ReactDOM<span>.</span><span>unstable_createRoot</span><span>(</span>domNode<span>)</span><span>.</span><span>render</span><span>(</span><span><span><span>&lt;</span>App</span> <span>/&gt;</span></span><span>)</span><span>;</span></code></pre></div>
<p>There is no documentation written for the Concurrent Mode yet. It is important to highlight that the conceptual model will likely be unfamiliar at first. Documenting its benefits, how to use it efficiently, and its pitfalls is a high priority for us, and will be a prerequisite for calling it stable. Until then, <a href="https://www.youtube.com/watch?v=ByBPyMBTzM0" rel="noopener noreferrer">Andrew’s talk</a> is the best introduction available.</p>
<p>Concurrent Mode is <em>much</em> less polished than Hooks. Some APIs aren’t properly “wired up” yet and don’t do what they’re expected to. At the time of writing this post, we don’t recommend using it for anything except very early experimentation. We don’t expect many bugs in Concurrent Mode itself, but note that components that produce warnings in <a href="https://reactjs.org/docs/strict-mode.html" rel="noopener noreferrer"><code>&lt;React.StrictMode&gt;</code></a> may not work correctly. On a separate note, we’ve seen that Concurrent Mode <em>surfaces</em> performance problems in other code which can sometimes be mistaken for performance issues in Concurrent Mode itself. For example, a stray <code>setInterval(fn, 1)</code> call that runs every millisecond would have a worse effect in Concurrent Mode. We plan to publish more guidance about diagnosing and fixing issues like this as part of this release’s documentation.</p>
<p>Concurrent Mode is a big part of our vision for React. For CPU-bound work, it allows non-blocking rendering and keeps your app responsive while rendering complex component trees. That’s demoed in the first part of <a href="https://reactjs.org/blog/2018/03/01/sneak-peek-beyond-react-16.html" rel="noopener noreferrer">our JSConf Iceland talk</a>. Concurrent Mode also makes Suspense better. It lets you avoid flickering a loading indicator if the network is fast enough. It’s hard to explain without seeing so <a href="https://www.youtube.com/watch?v=ByBPyMBTzM0" rel="noopener noreferrer">Andrew’s talk</a> is the best resource available today. Concurrent Mode relies on a cooperative main thread <a href="https://github.com/facebook/react/tree/master/packages/scheduler" rel="noopener noreferrer">scheduler</a>, and we are <a href="https://www.youtube.com/watch?v=mDdgfyRB5kg" rel="noopener noreferrer">collaborating with the Chrome team</a> to eventually move this functionality into the browser itself.</p>
<p><strong>Status in React DOM:</strong> A <em>very</em> unstable version of Concurrent Mode is available behind an <code>unstable_</code> prefix in React 16.6 but we don’t recommend trying it unless you’re willing to often run into walls or missing features. The 16.7 alphas include <code>React.ConcurrentMode</code> and <code>ReactDOM.createRoot</code> without an <code>unstable_</code> prefix, but we’ll likely keep the prefix in 16.7, and only document and mark Concurrent Mode as stable in this future minor release.</p>
<p><strong>Status in React DOM Server:</strong> Concurrent Mode doesn’t directly affect server rendering. It will work with the existing server renderer.</p>
<p><strong>Status in React Native:</strong> The current plan is to delay enabling Concurrent Mode in React Native until <a href="https://github.com/react-native-community/discussions-and-proposals/issues/4" rel="noopener noreferrer">React Fabric</a> project is near completion.</p>
<p><strong>Recommendation:</strong> If you wish to adopt Concurrent Mode in the future, wrapping some component subtrees in <a href="https://reactjs.org/docs/strict-mode.html" rel="noopener noreferrer"><code>&lt;React.StrictMode&gt;</code></a> and fixing the resulting warnings is a good first step. In general it’s not expected that legacy code would immediately be compatible. For example, at Facebook we mostly intend to use the Concurrent Mode in the more recently developed codebases, and keep the legacy ones running in the synchronous mode for the near future.</p>
<h3><a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#react-16x-mid-2019-the-one-with-suspense-for-data-fetching" rel="noopener noreferrer"></a>React 16.x (~mid 2019): The One with Suspense for Data Fetching </h3>
<p>As mentioned earlier, <em>Suspense</em> refers to React’s ability to “suspend” rendering while components are waiting for something, and display a loading indicator. In the already shipped React 16.6, the only supported use case for Suspense is code splitting. In this future minor release, we’d like to provide officially supported ways to use it for data fetching too. We’ll provide a reference implementation of a basic “React Cache” that’s compatible with Suspense, but you can also write your own. Data fetching libraries like Apollo and Relay will be able to integrate with Suspense by following a simple specification that we’ll document.</p>
<div><pre><code><span>// React Cache for simple data fetching (not final API)</span>
<span>import</span> <span>{</span>unstable_createResource<span>}</span> <span>from</span> <span>''react-cache''</span><span>;</span>

<span>// Tell React Cache how to fetch your data</span>
<span>const</span> TodoResource <span>=</span> <span>unstable_createResource</span><span>(</span>fetchTodo<span>)</span><span>;</span>

<span>function</span> <span>Todo</span><span>(</span>props<span>)</span> <span>{</span>
  <span>// Suspends until the data is in the cache</span>
  <span>const</span> todo <span>=</span> TodoResource<span>.</span><span>read</span><span>(</span>props<span>.</span>id<span>)</span><span>;</span>
  <span>return</span> <span><span><span>&lt;</span>li</span><span>&gt;</span></span><span>{</span>todo<span>.</span>title<span>}</span><span><span><span>&lt;/</span>li</span><span>&gt;</span></span><span>;</span>
<span>}</span>

<span>function</span> <span>App</span><span>(</span><span>)</span> <span>{</span>
  <span>return</span> <span>(</span>
    <span>// Same Suspense component you already use for code splitting</span>
    <span>// would be able to handle data fetching too.</span>
    <span><span><span>&lt;</span>React.Suspense</span> <span>fallback</span><span><span>=</span><span>{</span><span><span><span>&lt;</span>Spinner</span> <span>/&gt;</span></span><span>}</span></span><span>&gt;</span></span><span>
      </span><span><span><span>&lt;</span>ul</span><span>&gt;</span></span><span>
        </span><span>{</span><span>/* Siblings fetch in parallel */</span><span>}</span><span>
        </span><span><span><span>&lt;</span>Todo</span> <span>id</span><span><span>=</span><span>"</span>1<span>"</span></span> <span>/&gt;</span></span><span>
        </span><span><span><span>&lt;</span>Todo</span> <span>id</span><span><span>=</span><span>"</span>2<span>"</span></span> <span>/&gt;</span></span><span>
      </span><span><span><span>&lt;/</span>ul</span><span>&gt;</span></span><span>
    </span><span><span><span>&lt;/</span>React.Suspense</span><span>&gt;</span></span>
  <span>)</span><span>;</span>
<span>}</span>

<span>// Other libraries like Apollo and Relay can also</span>
<span>// provide Suspense integrations with similar APIs.</span></code></pre></div>
<p>There is no official documentation for how to fetch data with Suspense yet, but you can find some early information in <a href="https://youtu.be/ByBPyMBTzM0?t=1312" rel="noopener noreferrer">this talk</a> and <a href="https://github.com/facebook/react/blob/master/packages/react-devtools/CHANGELOG.md#suspense-toggle" rel="noopener noreferrer">this small demo</a>. We’ll write documentation for React Cache (and how to write your own Suspense-compatible library) closer to this React release, but if you’re curious, you can find its very early source code <a href="https://github.com/facebook/react/blob/master/packages/react-cache/src/ReactCache.js" rel="noopener noreferrer">here</a>.</p>
<p>The low-level Suspense mechanism (suspending rendering and showing a fallback) is expected to be stable even in React 16.6. We’ve used it for code splitting in production for months. However, the higher-level APIs for data fetching are very unstable. React Cache is rapidly changing, and will change at least a few more times. There are some low-level APIs that are <a href="https://github.com/reactjs/rfcs/pull/89" rel="noopener noreferrer">missing</a> for a good higher-level API to be possible. We don’t recommend using React Cache anywhere except very early experiments. Note that React Cache itself isn’t strictly tied to React releases, but the current alphas lack basic features as cache invalidation, and you’ll run into a wall very soon. We expect to have something usable with this React release.</p>
<p>Eventually we’d like most data fetching to happen through Suspense but it will take a long time until all integrations are ready. In practice we expect it to be adopted very incrementally, and often through layers like Apollo or Relay rather than directly. Missing higher level APIs aren’t the only obstacle — there are also some important UI patterns we don’t support yet such as <a href="https://github.com/facebook/react/issues/14248" rel="noopener noreferrer">showing progress indicator outside of the loading view hierarchy</a>. As always, we will communicate our progress in the release notes on this blog.</p>
<p><strong>Status in React DOM and React Native:</strong> Technically, a compatible cache would already work with <code>&lt;React.Suspense&gt;</code> in React 16.6. However, we don’t expect to have a good cache implementation until this React minor release. If you’re feeling adventurous, you can try to write your own cache by looking at the React Cache alphas. However, note that the mental model is sufficiently different that there’s a high risk of misunderstanding it until the docs are ready.</p>
<p><strong>Status in React DOM Server:</strong> Suspense is not available in the server renderer yet. As we mentioned earlier, we’ve started work on a new asynchronous server renderer that will support Suspense, but it’s a large project and will take a good chunk of 2019 to complete.</p>
<p><strong>Recommendation:</strong> Wait for this minor React release in order to use Suspense for data fetching. Don’t try to use Suspense features in 16.6 for it; it’s not supported. However, your existing <code>&lt;Suspense&gt;</code> components for code splitting will be able to show loading states for data too when Suspense for Data Fetching becomes officially supported.</p>
<h2><a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#other-projects" rel="noopener noreferrer"></a>Other Projects </h2>
<h3><a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#modernizing-react-dom" rel="noopener noreferrer"></a>Modernizing React DOM </h3>
<p>We started an investigation into <a href="https://github.com/facebook/react/issues/13525" rel="noopener noreferrer">simplifying and modernizing</a> ReactDOM, with a goal of reduced bundle size and aligning closer with the browser behavior. It is still early to say which specific bullet points will “make it” because the project is in an exploratory phase. We will communicate our progress on that issue.</p>
<h3><a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#suspense-for-server-rendering" rel="noopener noreferrer"></a>Suspense for Server Rendering </h3>
<p>We started designing a new server renderer that supports Suspense (including waiting for asynchronous data on the server without double rendering) and progressively loading and hydrating page content in chunks for best user experience. You can watch an overview of its early prototype in <a href="https://www.youtube.com/watch?v=z-6JC0_cOns" rel="noopener noreferrer">this talk</a>. The new server renderer is going to be our major focus in 2019, but it’s too early to say anything about its release schedule. Its development, as always, <a href="https://github.com/facebook/react/pulls?utf8=%E2%9C%93&amp;q=is%3Apr+is%3Aopen+fizz" rel="noopener noreferrer">will happen on GitHub</a>.</p>
<hr>
<p>And that’s about it! As you can see, there’s a lot here to keep us busy but we expect much progress in the coming months.</p>
<p>We hope this post gives you an idea of what we’re working on, what you can use today, and what you can expect to use in the future. While there’s a lot of discussion about new features on social media platforms, you won’t miss anything important if you read this blog.</p>
<p>We’re always open to feedback, and love to hear from you in the <a href="https://github.com/reactjs/rfcs" rel="noopener noreferrer">RFC repository</a>, <a href="https://github.com/facebook/react/issues" rel="noopener noreferrer">the issue tracker</a>, and <a href="https://mobile.twitter.com/reactjs" rel="noopener noreferrer">on Twitter</a>.</p>', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (58, 4, 'https://reactjs.org/blog/2018/12/19/react-v-16-7.html', 'React v16.7: No, This Is Not the One With Hooks', '2018-12-19T00:00:00+00:00', 'Our latest release includes an important performance bugfix for React.lazy. Although there are no API changes, we’re releasing it as a minor instead of a patch.
Why Is This Bugfix a Minor Instead of a Patch?
React follows semantic versioning. Typically, this means that we use patch versions for bugfixes, and minors for new (non-breaking) features. However, we reserve the option to release minor versions even if they do not include new features. The motivation is to reserve patches for changes that have a very low chance of breaking. Patches are the most important type of release because they sometimes contain critical bugfixes. That means patch releases have a higher bar for reliability. It’s unacceptable for a patch to introduce additional bugs, because if people come to distrust patches, it compromises our ability to fix critical bugs when they arise — for example, to fix a security vulnerability.
We never intend to ship bugs. React has a hard-earned reputation for stability, and we intend to keep it that way. We thoroughly test every version of React before releasing. This includes unit tests, generative (fuzzy) tests, integration tests, and internal dogfooding across tens of thousands of components. However, sometimes we make mistakes. That’s why, going forward, our policy will be that if a release contains non-trivial changes, we will bump the minor version, even if the external behavior is the same. We’ll also bump the minor when changing unstable_-prefixed APIs.
Can I Use Hooks Yet?
Not yet, but soon!
At React Conf, we said that 16.7 would be the first release to include Hooks. This was a mistake. We shouldn’t have attached a specific version number to an unreleased feature. We’ll avoid this in the future.
Although 16.7 does not include Hooks, please do not infer anything about the timeline of the Hooks launch. Our plans for Hooks are unchanged:

The Hooks proposal was accepted (with minor planned changes in response to feedback).
The implementation was merged into the React repo (behind a feature flag).
We’re currently in the testing phase, and you can expect a public release within a few months.

We’ve heard from many people who want to start using Hooks in their apps. We also can’t wait to ship them! But because Hooks changes how we write React components, we are taking extra time to get the details right. We appreciate your patience as we prepare this exciting new feature for widespread, ahem, use.
Learn more about our roadmap in our previous post.
Installation
React v16.7.0 is available on the npm registry.
To install React 16 with Yarn, run:
yarn add react@^16.7.0 react-dom@^16.7.0
To install React 16 with npm, run:
npm install --save react@^16.7.0 react-dom@^16.7.0
We also provide UMD builds of React via a CDN:
&lt;script crossorigin src="https://unpkg.com/react@16/umd/react.production.min.js"&gt;&lt;/script&gt;
&lt;script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"&gt;&lt;/script&gt;
Refer to the documentation for detailed installation instructions.
Changelog
React DOM

Fix performance of React.lazy for large numbers of lazily-loaded components. (@acdlite in #14429)
Clear fields on unmount to avoid memory leaks. (@trueadm in #14276)
Fix bug with SSR and context when mixing react-dom/server@16.6 and react@&lt;16.6. (@gaearon in #14291)
Fix a performance regression in profiling mode. (@bvaughn in #14383)

Scheduler (Experimental)

Post to MessageChannel instead of window. (@acdlite in #14234)
Reduce serialization overhead. (@developit in #14249)
Fix fallback to setTimeout in testing environments. (@bvaughn in #14358)
Add methods for debugging. (@mrkev in #14053)
', '<p>Our latest release includes an important performance bugfix for <code>React.lazy</code>. Although there are no API changes, we’re releasing it as a minor instead of a patch.</p>
<h2><a href="https://reactjs.org/blog/2018/12/19/react-v-16-7.html#why-is-this-bugfix-a-minor-instead-of-a-patch" rel="noopener noreferrer"></a>Why Is This Bugfix a Minor Instead of a Patch? </h2>
<p>React follows <a href="https://reactjs.org/docs/faq-versioning.html" rel="noopener noreferrer">semantic versioning</a>. Typically, this means that we use patch versions for bugfixes, and minors for new (non-breaking) features. However, we reserve the option to release minor versions even if they do not include new features. The motivation is to reserve patches for changes that have a very low chance of breaking. Patches are the most important type of release because they sometimes contain critical bugfixes. That means patch releases have a higher bar for reliability. It’s unacceptable for a patch to introduce additional bugs, because if people come to distrust patches, it compromises our ability to fix critical bugs when they arise — for example, to fix a security vulnerability.</p>
<p>We never intend to ship bugs. React has a hard-earned reputation for stability, and we intend to keep it that way. We thoroughly test every version of React before releasing. This includes unit tests, generative (fuzzy) tests, integration tests, and internal dogfooding across tens of thousands of components. However, sometimes we make mistakes. That’s why, going forward, our policy will be that if a release contains non-trivial changes, we will bump the minor version, even if the external behavior is the same. We’ll also bump the minor when changing <code>unstable_</code>-prefixed APIs.</p>
<h2><a href="https://reactjs.org/blog/2018/12/19/react-v-16-7.html#can-i-use-hooks-yet" rel="noopener noreferrer"></a>Can I Use Hooks Yet? </h2>
<p>Not yet, but soon!</p>
<p>At React Conf, we said that 16.7 would be the first release to include Hooks. This was a mistake. We shouldn’t have attached a specific version number to an unreleased feature. We’ll avoid this in the future.</p>
<p>Although 16.7 does not include Hooks, please do not infer anything about the timeline of the Hooks launch. Our plans for Hooks are unchanged:</p>
<ul>
<li>The <a href="https://github.com/reactjs/rfcs/pull/68" rel="noopener noreferrer">Hooks proposal</a> was accepted (<a href="https://github.com/reactjs/rfcs/pull/68#issuecomment-439314884" rel="noopener noreferrer">with minor planned changes in response to feedback</a>).</li>
<li>The <a href="https://github.com/facebook/react/commit/7bee9fbdd49aa5b9365a94b0ddf6db04bc1bf51c" rel="noopener noreferrer">implementation</a> was merged into the React repo (behind a feature flag).</li>
<li>We’re currently in the testing phase, and you can expect a public release within a few months.</li>
</ul>
<p>We’ve heard from many people who want to start using Hooks in their apps. We also can’t wait to ship them! But because Hooks changes how we write React components, we are taking extra time to get the details right. We appreciate your patience as we prepare this exciting new feature for widespread, ahem, <em>use</em>.</p>
<p>Learn more about <a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html" rel="noopener noreferrer">our roadmap</a> in our previous post.</p>
<h2><a href="https://reactjs.org/blog/2018/12/19/react-v-16-7.html#installation" rel="noopener noreferrer"></a>Installation </h2>
<p>React v16.7.0 is available on the npm registry.</p>
<p>To install React 16 with Yarn, run:</p>
<div><pre><code>yarn add react@^16.7.0 react-dom@^16.7.0</code></pre></div>
<p>To install React 16 with npm, run:</p>
<div><pre><code><span>npm</span> <span>install</span> --save react@^16.7.0 react-dom@^16.7.0</code></pre></div>
<p>We also provide UMD builds of React via a CDN:</p>
<div><pre><code><span><span><span>&lt;</span>script</span> <span>crossorigin</span> <span>src</span><span><span>=</span><span>"</span>https://unpkg.com/react@16/umd/react.production.min.js<span>"</span></span><span>&gt;</span></span><span></span><span><span><span>&lt;/</span>script</span><span>&gt;</span></span>
<span><span><span>&lt;</span>script</span> <span>crossorigin</span> <span>src</span><span><span>=</span><span>"</span>https://unpkg.com/react-dom@16/umd/react-dom.production.min.js<span>"</span></span><span>&gt;</span></span><span></span><span><span><span>&lt;/</span>script</span><span>&gt;</span></span></code></pre></div>
<p>Refer to the documentation for <a href="https://reactjs.org/docs/installation.html" rel="noopener noreferrer">detailed installation instructions</a>.</p>
<h2><a href="https://reactjs.org/blog/2018/12/19/react-v-16-7.html#changelog" rel="noopener noreferrer"></a>Changelog </h2>
<h3><a href="https://reactjs.org/blog/2018/12/19/react-v-16-7.html#react-dom" rel="noopener noreferrer"></a>React DOM </h3>
<ul>
<li>Fix performance of <code>React.lazy</code> for large numbers of lazily-loaded components. (<a href="http://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/14429" rel="noopener noreferrer">#14429</a>)</li>
<li>Clear fields on unmount to avoid memory leaks. (<a href="http://github.com/trueadm" rel="noopener noreferrer">@trueadm</a> in <a href="https://github.com/facebook/react/pull/14276" rel="noopener noreferrer">#14276</a>)</li>
<li>Fix bug with SSR and context when mixing <code>react-dom/server@16.6</code> and <code>react@&lt;16.6</code>. (<a href="http://github.com/gaearon" rel="noopener noreferrer">@gaearon</a> in <a href="https://github.com/facebook/react/pull/14291" rel="noopener noreferrer">#14291</a>)</li>
<li>Fix a performance regression in profiling mode. (<a href="http://github.com/bvaughn" rel="noopener noreferrer">@bvaughn</a> in <a href="https://github.com/facebook/react/pull/14383" rel="noopener noreferrer">#14383</a>)</li>
</ul>
<h3><a href="https://reactjs.org/blog/2018/12/19/react-v-16-7.html#scheduler-experimental" rel="noopener noreferrer"></a>Scheduler (Experimental) </h3>
<ul>
<li>Post to MessageChannel instead of window. (<a href="http://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/14234" rel="noopener noreferrer">#14234</a>)</li>
<li>Reduce serialization overhead. (<a href="http://github.com/developit" rel="noopener noreferrer">@developit</a> in <a href="https://github.com/facebook/react/pull/14249" rel="noopener noreferrer">#14249</a>)</li>
<li>Fix fallback to <code>setTimeout</code> in testing environments. (<a href="http://github.com/bvaughn" rel="noopener noreferrer">@bvaughn</a> in <a href="https://github.com/facebook/react/pull/14358" rel="noopener noreferrer">#14358</a>)</li>
<li>Add methods for debugging. (<a href="http://github.com/mrkev" rel="noopener noreferrer">@mrkev</a> in <a href="https://github.com/facebook/react/pull/14053" rel="noopener noreferrer">#14053</a>)</li>
</ul>', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (59, 4, 'https://reactjs.org/blog/2019/02/06/react-v16.8.0.html', 'React v16.8: The One With Hooks', '2019-02-06T00:00:00+00:00', 'With React 16.8, React Hooks are available in a stable release!
What Are Hooks?
Hooks let you use state and other React features without writing a class. You can also build your own Hooks to share reusable stateful logic between components.
If you’ve never heard of Hooks before, you might find these resources interesting:

Introducing Hooks explains why we’re adding Hooks to React.
Hooks at a Glance is a fast-paced overview of the built-in Hooks.
Building Your Own Hooks demonstrates code reuse with custom Hooks.
Making Sense of React Hooks explores the new possibilities unlocked by Hooks.
useHooks.com showcases community-maintained Hooks recipes and demos.

You don’t have to learn Hooks right now. Hooks have no breaking changes, and we have no plans to remove classes from React. The Hooks FAQ describes the gradual adoption strategy.
No Big Rewrites
We don’t recommend rewriting your existing applications to use Hooks overnight. Instead, try using Hooks in some of the new components, and let us know what you think. Code using Hooks will work side by side with existing code using classes.
Can I Use Hooks Today?
Yes! Starting with 16.8.0, React includes a stable implementation of React Hooks for:

React DOM
React DOM Server
React Test Renderer
React Shallow Renderer

Note that to enable Hooks, all React packages need to be 16.8.0 or higher. Hooks won’t work if you forget to update, for example, React DOM.
React Native will support Hooks in the 0.59 release.
Tooling Support
React Hooks are now supported by React DevTools. They are also supported in the latest Flow and TypeScript definitions for React. We strongly recommend enabling a new lint rule called eslint-plugin-react-hooks to enforce best practices with Hooks. It will soon be included into Create React App by default.
What’s Next
We described our plan for the next months in the recently published React Roadmap.
Note that React Hooks don’t cover all use cases for classes yet but they’re very close. Currently, only getSnapshotBeforeUpdate() and componentDidCatch() methods don’t have equivalent Hooks APIs, and these lifecycles are relatively uncommon. If you want, you should be able to use Hooks in most of the new code you’re writing.
Even while Hooks were in alpha, the React community created many interesting examples and recipes using Hooks for animations, forms, subscriptions, integrating with other libraries, and so on. We’re excited about Hooks because they make code reuse easier, helping you write your components in a simpler way and make great user experiences. We can’t wait to see what you’ll create next!
Testing Hooks
We have added a new API called ReactTestUtils.act() in this release. It ensures that the behavior in your tests matches what happens in the browser more closely. We recommend to wrap any code rendering and triggering updates to your components into act() calls. Testing libraries can also wrap their APIs with it (for example, react-testing-library’s render and fireEvent utilities do this).
For example, the counter example from this page can be tested like this:
import React from ''react'';
import ReactDOM from ''react-dom'';
import { act } from ''react-dom/test-utils'';
import Counter from ''./Counter'';

let container;

beforeEach(() =&gt; {
  container = document.createElement(''div'');
  document.body.appendChild(container);
});

afterEach(() =&gt; {
  document.body.removeChild(container);
  container = null;
});

it(''can render and update a counter'', () =&gt; {
  // Test first render and effect
  act(() =&gt; {
    ReactDOM.render(&lt;Counter /&gt;, container);
  });
  const button = container.querySelector(''button'');
  const label = container.querySelector(''p'');
  expect(label.textContent).toBe(''You clicked 0 times'');
  expect(document.title).toBe(''You clicked 0 times'');

  // Test second render and effect
  act(() =&gt; {
    button.dispatchEvent(new MouseEvent(''click'', {bubbles: true}));
  });
  expect(label.textContent).toBe(''You clicked 1 times'');
  expect(document.title).toBe(''You clicked 1 times'');
});
The calls to act() will also flush the effects inside of them.
If you need to test a custom Hook, you can do so by creating a component in your test, and using your Hook from it. Then you can test the component you wrote.
To reduce the boilerplate, we recommend using react-testing-library which is designed to encourage writing tests that use your components as the end users do.
Thanks
We’d like to thank everybody who commented on the Hooks RFC for sharing their feedback. We’ve read all of your comments and made some adjustments to the final API based on them.
Installation
React
React v16.8.0 is available on the npm registry.
To install React 16 with Yarn, run:
yarn add react@^16.8.0 react-dom@^16.8.0
To install React 16 with npm, run:
npm install --save react@^16.8.0 react-dom@^16.8.0
We also provide UMD builds of React via a CDN:
&lt;script crossorigin src="https://unpkg.com/react@16/umd/react.production.min.js"&gt;&lt;/script&gt;
&lt;script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"&gt;&lt;/script&gt;
Refer to the documentation for detailed installation instructions.
ESLint Plugin for React Hooks

Note
As mentioned above, we strongly recommend using the eslint-plugin-react-hooks lint rule.
If you’re using Create React App, instead of manually configuring ESLint you can wait for the next version of react-scripts which will come out shortly and will include this rule.

Assuming you already have ESLint installed, run:
# npm
npm install eslint-plugin-react-hooks --save-dev

# yarn
yarn add eslint-plugin-react-hooks --dev
Then add it to your ESLint configuration:
{
  "plugins": [
    // ...
    "react-hooks"
  ],
  "rules": {
    // ...
    "react-hooks/rules-of-hooks": "error"
  }
}
Changelog
React

Add Hooks — a way to use state and other React features without writing a class. (@acdlite et al. in #13968)
Improve the useReducer Hook lazy initialization API. (@acdlite in #14723)

React DOM

Bail out of rendering on identical values for useState and useReducer Hooks. (@acdlite in #14569)
Don’t compare the first argument passed to useEffect/useMemo/useCallback Hooks. (@acdlite in #14594)
Use Object.is algorithm for comparing useState and useReducer values. (@Jessidhia in #14752)
Support synchronous thenables passed to React.lazy(). (@gaearon in #14626)
Render components with Hooks twice in Strict Mode (DEV-only) to match class behavior. (@gaearon in #14654)
Warn about mismatching Hook order in development. (@threepointone in #14585 and @acdlite in #14591)
Effect clean-up functions must return either undefined or a function. All other values, including null, are not allowed. @acdlite in #14119

React Test Renderer

Support Hooks in the shallow renderer. (@trueadm in #14567)
Fix wrong state in shouldComponentUpdate in the presence of getDerivedStateFromProps for Shallow Renderer. (@chenesan in #14613)
Add ReactTestRenderer.act() and ReactTestUtils.act() for batching updates so that tests more closely match real behavior. (@threepointone in #14744)

ESLint Plugin: React Hooks

Initial release. (@calebmer in #13968)
Fix reporting after encountering a loop. (@calebmer and @Yurickh in #14661)
Don’t consider throwing to be a rule violation. (@sophiebits in #14040)

Hooks Changelog Since Alpha Versions
The above changelog contains all notable changes since our last stable release (16.7.0). As with all our minor releases, none of the changes break backwards compatibility.
If you’re currently using Hooks from an alpha build of React, note that this release does contain some small breaking changes to Hooks. We don’t recommend depending on alphas in production code. We publish them so we can make changes in response to community feedback before the API is stable.
Here are all breaking changes to Hooks that have been made since the first alpha release:

Remove useMutationEffect. (@sophiebits in #14336)
Rename useImperativeMethods to useImperativeHandle. (@threepointone in #14565)
Bail out of rendering on identical values for useState and useReducer Hooks. (@acdlite in #14569)
Don’t compare the first argument passed to useEffect/useMemo/useCallback Hooks. (@acdlite in #14594)
Use Object.is algorithm for comparing useState and useReducer values. (@Jessidhia in #14752)
Render components with Hooks twice in Strict Mode (DEV-only). (@gaearon in #14654)
Improve the useReducer Hook lazy initialization API. (@acdlite in #14723)
', '<p>With React 16.8, <a href="https://reactjs.org/docs/hooks-intro.html" rel="noopener noreferrer">React Hooks</a> are available in a stable release!</p>
<h2><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#what-are-hooks" rel="noopener noreferrer"></a>What Are Hooks? </h2>
<p>Hooks let you use state and other React features without writing a class. You can also <strong>build your own Hooks</strong> to share reusable stateful logic between components.</p>
<p>If you’ve never heard of Hooks before, you might find these resources interesting:</p>
<ul>
<li><a href="https://reactjs.org/docs/hooks-intro.html" rel="noopener noreferrer">Introducing Hooks</a> explains why we’re adding Hooks to React.</li>
<li><a href="https://reactjs.org/docs/hooks-overview.html" rel="noopener noreferrer">Hooks at a Glance</a> is a fast-paced overview of the built-in Hooks.</li>
<li><a href="https://reactjs.org/docs/hooks-custom.html" rel="noopener noreferrer">Building Your Own Hooks</a> demonstrates code reuse with custom Hooks.</li>
<li><a href="https://medium.com/@dan_abramov/making-sense-of-react-hooks-fdbde8803889" rel="noopener noreferrer">Making Sense of React Hooks</a> explores the new possibilities unlocked by Hooks.</li>
<li><a href="https://usehooks.com/" rel="noopener noreferrer">useHooks.com</a> showcases community-maintained Hooks recipes and demos.</li>
</ul>
<p><strong>You don’t have to learn Hooks right now.</strong> Hooks have no breaking changes, and we have no plans to remove classes from React. The <a href="https://reactjs.org/docs/hooks-faq.html" rel="noopener noreferrer">Hooks FAQ</a> describes the gradual adoption strategy.</p>
<h2><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#no-big-rewrites" rel="noopener noreferrer"></a>No Big Rewrites </h2>
<p>We don’t recommend rewriting your existing applications to use Hooks overnight. Instead, try using Hooks in some of the new components, and let us know what you think. Code using Hooks will work <a href="https://reactjs.org/docs/hooks-intro.html#gradual-adoption-strategy" rel="noopener noreferrer">side by side</a> with existing code using classes.</p>
<h2><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#can-i-use-hooks-today" rel="noopener noreferrer"></a>Can I Use Hooks Today? </h2>
<p>Yes! Starting with 16.8.0, React includes a stable implementation of React Hooks for:</p>
<ul>
<li>React DOM</li>
<li>React DOM Server</li>
<li>React Test Renderer</li>
<li>React Shallow Renderer</li>
</ul>
<p>Note that <strong>to enable Hooks, all React packages need to be 16.8.0 or higher</strong>. Hooks won’t work if you forget to update, for example, React DOM.</p>
<p><strong>React Native will support Hooks in the <a href="https://github.com/react-native-community/react-native-releases/issues/79#issuecomment-457735214" rel="noopener noreferrer">0.59 release</a>.</strong></p>
<h2><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#tooling-support" rel="noopener noreferrer"></a>Tooling Support </h2>
<p>React Hooks are now supported by React DevTools. They are also supported in the latest Flow and TypeScript definitions for React. We strongly recommend enabling a new <a href="https://www.npmjs.com/package/eslint-plugin-react-hooks" rel="noopener noreferrer">lint rule called <code>eslint-plugin-react-hooks</code></a> to enforce best practices with Hooks. It will soon be included into Create React App by default.</p>
<h2><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#whats-next" rel="noopener noreferrer"></a>What’s Next </h2>
<p>We described our plan for the next months in the recently published <a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html" rel="noopener noreferrer">React Roadmap</a>.</p>
<p>Note that React Hooks don’t cover <em>all</em> use cases for classes yet but they’re <a href="https://reactjs.org/docs/hooks-faq.html#do-hooks-cover-all-use-cases-for-classes" rel="noopener noreferrer">very close</a>. Currently, only <code>getSnapshotBeforeUpdate()</code> and <code>componentDidCatch()</code> methods don’t have equivalent Hooks APIs, and these lifecycles are relatively uncommon. If you want, you should be able to use Hooks in most of the new code you’re writing.</p>
<p>Even while Hooks were in alpha, the React community created many interesting <a href="https://codesandbox.io/react-hooks" rel="noopener noreferrer">examples</a> and <a href="https://usehooks.com/" rel="noopener noreferrer">recipes</a> using Hooks for animations, forms, subscriptions, integrating with other libraries, and so on. We’re excited about Hooks because they make code reuse easier, helping you write your components in a simpler way and make great user experiences. We can’t wait to see what you’ll create next!</p>
<h2><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#testing-hooks" rel="noopener noreferrer"></a>Testing Hooks </h2>
<p>We have added a new API called <code>ReactTestUtils.act()</code> in this release. It ensures that the behavior in your tests matches what happens in the browser more closely. We recommend to wrap any code rendering and triggering updates to your components into <code>act()</code> calls. Testing libraries can also wrap their APIs with it (for example, <a href="https://testing-library.com/react" rel="noopener noreferrer"><code>react-testing-library</code></a>’s <code>render</code> and <code>fireEvent</code> utilities do this).</p>
<p>For example, the counter example from <a href="https://reactjs.org/docs/hooks-effect.html" rel="noopener noreferrer">this page</a> can be tested like this:</p>
<div><pre><code><span>import</span> React <span>from</span> <span>''react''</span><span>;</span>
<span>import</span> ReactDOM <span>from</span> <span>''react-dom''</span><span>;</span>
<span><span>import</span> <span>{</span> act <span>}</span> <span>from</span> <span>''react-dom/test-utils''</span><span>;</span>
</span><span>import</span> Counter <span>from</span> <span>''./Counter''</span><span>;</span>

<span>let</span> container<span>;</span>

<span>beforeEach</span><span>(</span><span>(</span><span>)</span> <span>=&gt;</span> <span>{</span>
  container <span>=</span> document<span>.</span><span>createElement</span><span>(</span><span>''div''</span><span>)</span><span>;</span>
  document<span>.</span>body<span>.</span><span>appendChild</span><span>(</span>container<span>)</span><span>;</span>
<span>}</span><span>)</span><span>;</span>

<span>afterEach</span><span>(</span><span>(</span><span>)</span> <span>=&gt;</span> <span>{</span>
  document<span>.</span>body<span>.</span><span>removeChild</span><span>(</span>container<span>)</span><span>;</span>
  container <span>=</span> <span>null</span><span>;</span>
<span>}</span><span>)</span><span>;</span>

<span>it</span><span>(</span><span>''can render and update a counter''</span><span>,</span> <span>(</span><span>)</span> <span>=&gt;</span> <span>{</span>
  <span>// Test first render and effect</span>
<span>  <span>act</span><span>(</span><span>(</span><span>)</span> <span>=&gt;</span> <span>{</span>
</span><span>    ReactDOM<span>.</span><span>render</span><span>(</span><span><span><span>&lt;</span>Counter</span> <span>/&gt;</span></span><span>,</span> container<span>)</span><span>;</span>
</span><span>  <span>}</span><span>)</span><span>;</span>
</span>  <span>const</span> button <span>=</span> container<span>.</span><span>querySelector</span><span>(</span><span>''button''</span><span>)</span><span>;</span>
  <span>const</span> label <span>=</span> container<span>.</span><span>querySelector</span><span>(</span><span>''p''</span><span>)</span><span>;</span>
  <span>expect</span><span>(</span>label<span>.</span>textContent<span>)</span><span>.</span><span>toBe</span><span>(</span><span>''You clicked 0 times''</span><span>)</span><span>;</span>
  <span>expect</span><span>(</span>document<span>.</span>title<span>)</span><span>.</span><span>toBe</span><span>(</span><span>''You clicked 0 times''</span><span>)</span><span>;</span>

  <span>// Test second render and effect</span>
<span>  <span>act</span><span>(</span><span>(</span><span>)</span> <span>=&gt;</span> <span>{</span>
</span><span>    button<span>.</span><span>dispatchEvent</span><span>(</span><span>new</span> <span>MouseEvent</span><span>(</span><span>''click''</span><span>,</span> <span>{</span>bubbles<span>:</span> <span>true</span><span>}</span><span>)</span><span>)</span><span>;</span>
</span><span>  <span>}</span><span>)</span><span>;</span>
</span>  <span>expect</span><span>(</span>label<span>.</span>textContent<span>)</span><span>.</span><span>toBe</span><span>(</span><span>''You clicked 1 times''</span><span>)</span><span>;</span>
  <span>expect</span><span>(</span>document<span>.</span>title<span>)</span><span>.</span><span>toBe</span><span>(</span><span>''You clicked 1 times''</span><span>)</span><span>;</span>
<span>}</span><span>)</span><span>;</span></code></pre></div>
<p>The calls to <code>act()</code> will also flush the effects inside of them.</p>
<p>If you need to test a custom Hook, you can do so by creating a component in your test, and using your Hook from it. Then you can test the component you wrote.</p>
<p>To reduce the boilerplate, we recommend using <a href="https://testing-library.com/react" rel="noopener noreferrer"><code>react-testing-library</code></a> which is designed to encourage writing tests that use your components as the end users do.</p>
<h2><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#thanks" rel="noopener noreferrer"></a>Thanks </h2>
<p>We’d like to thank everybody who commented on the <a href="https://github.com/reactjs/rfcs/pull/68" rel="noopener noreferrer">Hooks RFC</a> for sharing their feedback. We’ve read all of your comments and made some adjustments to the final API based on them.</p>
<h2><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#installation" rel="noopener noreferrer"></a>Installation </h2>
<h3><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#react" rel="noopener noreferrer"></a>React </h3>
<p>React v16.8.0 is available on the npm registry.</p>
<p>To install React 16 with Yarn, run:</p>
<div><pre><code>yarn add react@^16.8.0 react-dom@^16.8.0</code></pre></div>
<p>To install React 16 with npm, run:</p>
<div><pre><code><span>npm</span> <span>install</span> --save react@^16.8.0 react-dom@^16.8.0</code></pre></div>
<p>We also provide UMD builds of React via a CDN:</p>
<div><pre><code><span><span><span>&lt;</span>script</span> <span>crossorigin</span> <span>src</span><span><span>=</span><span>"</span>https://unpkg.com/react@16/umd/react.production.min.js<span>"</span></span><span>&gt;</span></span><span></span><span><span><span>&lt;/</span>script</span><span>&gt;</span></span>
<span><span><span>&lt;</span>script</span> <span>crossorigin</span> <span>src</span><span><span>=</span><span>"</span>https://unpkg.com/react-dom@16/umd/react-dom.production.min.js<span>"</span></span><span>&gt;</span></span><span></span><span><span><span>&lt;/</span>script</span><span>&gt;</span></span></code></pre></div>
<p>Refer to the documentation for <a href="https://reactjs.org/docs/installation.html" rel="noopener noreferrer">detailed installation instructions</a>.</p>
<h3><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#eslint-plugin-for-react-hooks" rel="noopener noreferrer"></a>ESLint Plugin for React Hooks </h3>
<blockquote>
<p>Note</p>
<p>As mentioned above, we strongly recommend using the <code>eslint-plugin-react-hooks</code> lint rule.</p>
<p>If you’re using Create React App, instead of manually configuring ESLint you can wait for the next version of <code>react-scripts</code> which will come out shortly and will include this rule.</p>
</blockquote>
<p>Assuming you already have ESLint installed, run:</p>
<div><pre><code># npm
npm install eslint-plugin-react-hooks --save-dev

# yarn
yarn add eslint-plugin-react-hooks --dev</code></pre></div>
<p>Then add it to your ESLint configuration:</p>
<div><pre><code><span>{</span>
  <span>"plugins"</span><span>:</span> <span>[</span>
    <span>// ...</span>
    <span>"react-hooks"</span>
  <span>]</span><span>,</span>
  <span>"rules"</span><span>:</span> <span>{</span>
    <span>// ...</span>
    <span>"react-hooks/rules-of-hooks"</span><span>:</span> <span>"error"</span>
  <span>}</span>
<span>}</span></code></pre></div>
<h2><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#changelog" rel="noopener noreferrer"></a>Changelog </h2>
<h3><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#react-1" rel="noopener noreferrer"></a>React </h3>
<ul>
<li>Add <a href="https://reactjs.org/docs/hooks-intro.html" rel="noopener noreferrer">Hooks</a> — a way to use state and other React features without writing a class. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> et al. in <a href="https://github.com/facebook/react/pull/13968" rel="noopener noreferrer">#13968</a>)</li>
<li>Improve the <code>useReducer</code> Hook lazy initialization API. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/14723" rel="noopener noreferrer">#14723</a>)</li>
</ul>
<h3><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#react-dom" rel="noopener noreferrer"></a>React DOM </h3>
<ul>
<li>Bail out of rendering on identical values for <code>useState</code> and <code>useReducer</code> Hooks. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/14569" rel="noopener noreferrer">#14569</a>)</li>
<li>Don’t compare the first argument passed to <code>useEffect</code>/<code>useMemo</code>/<code>useCallback</code> Hooks. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/14594" rel="noopener noreferrer">#14594</a>)</li>
<li>Use <code>Object.is</code> algorithm for comparing <code>useState</code> and <code>useReducer</code> values. (<a href="https://github.com/Jessidhia" rel="noopener noreferrer">@Jessidhia</a> in <a href="https://github.com/facebook/react/pull/14752" rel="noopener noreferrer">#14752</a>)</li>
<li>Support synchronous thenables passed to <code>React.lazy()</code>. (<a href="https://github.com/gaearon" rel="noopener noreferrer">@gaearon</a> in <a href="https://github.com/facebook/react/pull/14626" rel="noopener noreferrer">#14626</a>)</li>
<li>Render components with Hooks twice in Strict Mode (DEV-only) to match class behavior. (<a href="https://github.com/gaearon" rel="noopener noreferrer">@gaearon</a> in <a href="https://github.com/facebook/react/pull/14654" rel="noopener noreferrer">#14654</a>)</li>
<li>Warn about mismatching Hook order in development. (<a href="https://github.com/threepointone" rel="noopener noreferrer">@threepointone</a> in <a href="https://github.com/facebook/react/pull/14585" rel="noopener noreferrer">#14585</a> and <a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/14591" rel="noopener noreferrer">#14591</a>)</li>
<li>Effect clean-up functions must return either <code>undefined</code> or a function. All other values, including <code>null</code>, are not allowed. <a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/14119" rel="noopener noreferrer">#14119</a></li>
</ul>
<h3><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#react-test-renderer" rel="noopener noreferrer"></a>React Test Renderer </h3>
<ul>
<li>Support Hooks in the shallow renderer. (<a href="https://github.com/trueadm" rel="noopener noreferrer">@trueadm</a> in <a href="https://github.com/facebook/react/pull/14567" rel="noopener noreferrer">#14567</a>)</li>
<li>Fix wrong state in <code>shouldComponentUpdate</code> in the presence of <code>getDerivedStateFromProps</code> for Shallow Renderer. (<a href="https://github.com/chenesan" rel="noopener noreferrer">@chenesan</a> in <a href="https://github.com/facebook/react/pull/14613" rel="noopener noreferrer">#14613</a>)</li>
<li>Add <code>ReactTestRenderer.act()</code> and <code>ReactTestUtils.act()</code> for batching updates so that tests more closely match real behavior. (<a href="https://github.com/threepointone" rel="noopener noreferrer">@threepointone</a> in <a href="https://github.com/facebook/react/pull/14744" rel="noopener noreferrer">#14744</a>)</li>
</ul>
<h3><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#eslint-plugin-react-hooks" rel="noopener noreferrer"></a>ESLint Plugin: React Hooks </h3>
<ul>
<li>Initial <a href="https://www.npmjs.com/package/eslint-plugin-react-hooks" rel="noopener noreferrer">release</a>. (<a href="https://github.com/calebmer" rel="noopener noreferrer">@calebmer</a> in <a href="https://github.com/facebook/react/pull/13968" rel="noopener noreferrer">#13968</a>)</li>
<li>Fix reporting after encountering a loop. (<a href="https://github.com/calebmer" rel="noopener noreferrer">@calebmer</a> and <a href="https://github.com/Yurickh" rel="noopener noreferrer">@Yurickh</a> in <a href="https://github.com/facebook/react/pull/14661" rel="noopener noreferrer">#14661</a>)</li>
<li>Don’t consider throwing to be a rule violation. (<a href="https://github.com/sophiebits" rel="noopener noreferrer">@sophiebits</a> in <a href="https://github.com/facebook/react/pull/14040" rel="noopener noreferrer">#14040</a>)</li>
</ul>
<h2><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html#hooks-changelog-since-alpha-versions" rel="noopener noreferrer"></a>Hooks Changelog Since Alpha Versions </h2>
<p>The above changelog contains all notable changes since our last <strong>stable</strong> release (16.7.0). <a href="https://reactjs.org/docs/faq-versioning.html" rel="noopener noreferrer">As with all our minor releases</a>, none of the changes break backwards compatibility.</p>
<p>If you’re currently using Hooks from an alpha build of React, note that this release does contain some small breaking changes to Hooks. <strong>We don’t recommend depending on alphas in production code.</strong> We publish them so we can make changes in response to community feedback before the API is stable.</p>
<p>Here are all breaking changes to Hooks that have been made since the first alpha release:</p>
<ul>
<li>Remove <code>useMutationEffect</code>. (<a href="https://github.com/sophiebits" rel="noopener noreferrer">@sophiebits</a> in <a href="https://github.com/facebook/react/pull/14336" rel="noopener noreferrer">#14336</a>)</li>
<li>Rename <code>useImperativeMethods</code> to <code>useImperativeHandle</code>. (<a href="https://github.com/threepointone" rel="noopener noreferrer">@threepointone</a> in <a href="https://github.com/facebook/react/pull/14565" rel="noopener noreferrer">#14565</a>)</li>
<li>Bail out of rendering on identical values for <code>useState</code> and <code>useReducer</code> Hooks. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/14569" rel="noopener noreferrer">#14569</a>)</li>
<li>Don’t compare the first argument passed to <code>useEffect</code>/<code>useMemo</code>/<code>useCallback</code> Hooks. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/14594" rel="noopener noreferrer">#14594</a>)</li>
<li>Use <code>Object.is</code> algorithm for comparing <code>useState</code> and <code>useReducer</code> values. (<a href="https://github.com/Jessidhia" rel="noopener noreferrer">@Jessidhia</a> in <a href="https://github.com/facebook/react/pull/14752" rel="noopener noreferrer">#14752</a>)</li>
<li>Render components with Hooks twice in Strict Mode (DEV-only). (<a href="https://github.com/gaearon" rel="noopener noreferrer">@gaearon</a> in <a href="https://github.com/facebook/react/pull/14654" rel="noopener noreferrer">#14654</a>)</li>
<li>Improve the <code>useReducer</code> Hook lazy initialization API. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/14723" rel="noopener noreferrer">#14723</a>)</li>
</ul>', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (60, 4, 'https://reactjs.org/blog/2019/02/23/is-react-translated-yet.html', 'Is React Translated Yet? ¡Sí! Sim! はい！', '2019-02-23T00:00:00+00:00', 'We’re excited to announce an ongoing effort to maintain official translations of the React documentation website into different languages. Thanks to the dedicated efforts of React community members from around the world, React is now being translated into over 30 languages! You can find them on the new Languages page.
In addition, the following three languages have completed translating most of the React Docs! 🎉

Spanish: es.reactjs.org
Japanese: ja.reactjs.org
Brazilian Portuguese: pt-br.reactjs.org

Special congratulations to Alejandro Ñáñez Ortiz, Rainer Martínez Fraga, David Morales, Miguel Alejandro Bolivar Portilla, and all the contributors to the Spanish translation for being the first to completely translate the core pages of the docs!
Why Localization Matters
React already has many meetups and conferences around the world, but many programmers don’t use English as their primary language. We’d love to support local communities who use React by making our documentation available in most popular languages.
In the past, React community members have created unofficial translations for Chinese, Arabic, and Korean; by making an official channel for these translated docs we’re hoping to make them easier to find and help make sure that non-English-speaking users of React aren’t left behind.
Contributing
If you would like to help out on a current translation, check out the Languages page and click on the “Contribute” link for your language.
Can’t find your language? If you’d like to maintain your language’s translation fork, follow the instructions in the translation repo!
Backstory
Hi everyone! I’m Nat! You may know me as the polyhedra lady. For the past few weeks, I’ve been helping the React team coordinate their translation effort. Here’s how I did it.
Our original approach for translations was to use a SaaS platform that allows users to submit translations. There was already a pull request to integrate it and my original responsibility was to finish that integration. However, we had concerns about the feasibility of that integration and the current quality of translations on the platform. Our primary concern was ensuring that translations kept up to date with the main repo and didn’t become “stale”.
Dan encouraged me to look for alternate solutions, and we stumbled across how Vue maintained its translations — through different forks of the main repo on GitHub. In particular, the Japanese translation used a bot to periodically check for changes in the English repo and submits pull requests whenever there is a change.
This approach appealed to us for several reasons:

It was less code integration to get off the ground.
It encouraged active maintainers for each repo to ensure quality.
Contributors already understand GitHub as a platform and are motivated to contribute directly to the React organization.

We started off with an initial trial period of three languages: Spanish, Japanese, and Simplified Chinese. This allowed us to work out any kinks in our process and make sure future translations are set up for success. I wanted to give the translation teams freedom to choose whatever tools they felt comfortable with. The only requirement is a checklist that outlines the order of importance for translating pages.
After the trial period, we were ready to accept more languages. I created a script to automate the creation of the new language repo, and a site, Is React Translated Yet?, to track progress on the different translations. We started 10 new translations on our first day alone!
Because of the automation, the rest of the maintenance went mostly smoothly. We eventually created a Slack channel to make it easier for translators to share information, and I released a guide solidifying the responsibilities of maintainers. Allowing translators to talk with each other was a great boon — for example, the Arabic, Persian, and Hebrew translations were able to talk to each other in order to get right-to-left text working!
The Bot
The most challenging part was getting the bot to sync changes from the English version of the site. Initially we were using the che-tsumi bot created by the Japanese Vue translation team, but we soon decided to build our own bot to suit our needs. In particular, the che-tsumi bot works by cherry picking new commits. This ended up causing a cavalade of new issues that were interconnected, especially when Hooks were released.
In the end, we decided that instead of cherry picking each commit, it made more sense to merge all new commits and create a pull request around once a day. Conflicts are merged as-is and listed in the pull request, leaving a checklist for maintainers to fix.
Creating the sync script was easy enough: it downloads the translated repo, adds the original as a remote, pulls from it, merges the conflicts, and creates a pull request.
The problem was finding a place for the bot to run. I’m a frontend developer for a reason — Heroku and its ilk are alien to me and endlessly frustrating. In fact, until this past Tuesday, I was running the script by hand on my local machine!
The biggest challenge was space. Each fork of the repo is around 100MB — which takes minutes to clone on my local machine. We have 32 forks, and the free tiers or most deployment platforms I checked limited you to 512MB of storage.
After lots of notepad calculations, I found a solution: delete each repo once we’ve finished the script and limit the concurrency of sync scripts that run at once to be within the storage requirements. Luckily, Heroku dynos have a much faster Internet connection and are able to clone even the React repo quickly.
There were other smaller issues that I ran into. I tried using the Heroku Scheduler add-on so I didn’t have to write any actual watch code, but it end up running too inconsistently, and I had an existential meltdown on Twitter when I couldn’t figure out how to send commits from the Heroku dyno. But in the end, this frontend engineer was able to get the bot working!
There are, as always, improvements I want to make to the bot. Right now it doesn’t check whether there is an outstanding pull request before pushing another one. It’s still hard to tell the exact change that happened in the original source, and it’s possible to miss out on a needed translation change. But I trust the maintainers we’ve chosen to work through these issues, and the bot is open source if anyone wants to help me make these improvements!
Thanks
Finally, I would like to extend my gratitude to the following people and groups:

All the translation maintainers and contributors who are helping translate React to more than thirty languages.
The Vue.js Japan User Group for initiating the idea of having bot-managed translations, and especially Hanatani Takuma for helping us understand their approach and helping maintain the Japanese translation.
Soichiro Miki for many contributions and thoughtful comments on the overall translation process, as well as for maintaining the Japanese translation.
Eric Nakagawa for managing our previous translation process.
Brian Vaughn for setting up the languages page and managing all the subdomains.

 And finally, thank you to Dan Abramov for giving me this opportunity and being a great mentor along the way.', '<p>We’re excited to announce an ongoing effort to maintain official translations of the React documentation website into different languages. Thanks to the dedicated efforts of React community members from around the world, React is now being translated into <em>over 30</em> languages! You can find them on the new <a href="https://reactjs.org/languages" rel="noopener noreferrer">Languages</a> page.</p>
<p>In addition, the following three languages have completed translating most of the React Docs! 🎉</p>
<ul>
<li><strong>Spanish: <a href="https://es.reactjs.org/" rel="noopener noreferrer">es.reactjs.org</a></strong></li>
<li><strong>Japanese: <a href="https://ja.reactjs.org/" rel="noopener noreferrer">ja.reactjs.org</a></strong></li>
<li><strong>Brazilian Portuguese: <a href="https://pt-br.reactjs.org/" rel="noopener noreferrer">pt-br.reactjs.org</a></strong></li>
</ul>
<p>Special congratulations to <a href="https://github.com/alejandronanez" rel="noopener noreferrer">Alejandro Ñáñez Ortiz</a>, <a href="https://github.com/carburo" rel="noopener noreferrer">Rainer Martínez Fraga</a>, <a href="https://github.com/dmorales" rel="noopener noreferrer">David Morales</a>, <a href="https://github.com/Darking360" rel="noopener noreferrer">Miguel Alejandro Bolivar Portilla</a>, and all the contributors to the Spanish translation for being the first to <em>completely</em> translate the core pages of the docs!</p>
<h2><a href="https://reactjs.org/blog/2019/02/23/is-react-translated-yet.html#why-localization-matters" rel="noopener noreferrer"></a>Why Localization Matters </h2>
<p>React already has many meetups and conferences around the world, but many programmers don’t use English as their primary language. We’d love to support local communities who use React by making our documentation available in most popular languages.</p>
<p>In the past, React community members have created unofficial translations for <a href="https://github.com/discountry/react" rel="noopener noreferrer">Chinese</a>, <a href="https://wiki.hsoub.com/React" rel="noopener noreferrer">Arabic</a>, and <a href="https://github.com/reactjs/ko.reactjs.org/issues/4" rel="noopener noreferrer">Korean</a>; by making an official channel for these translated docs we’re hoping to make them easier to find and help make sure that non-English-speaking users of React aren’t left behind.</p>
<h2><a href="https://reactjs.org/blog/2019/02/23/is-react-translated-yet.html#contributing" rel="noopener noreferrer"></a>Contributing </h2>
<p>If you would like to help out on a current translation, check out the <a href="https://reactjs.org/languages" rel="noopener noreferrer">Languages</a> page and click on the “Contribute” link for your language.</p>
<p>Can’t find your language? If you’d like to maintain your language’s translation fork, follow the instructions in the <a href="https://github.com/reactjs/reactjs.org-translation#starting-a-new-translation" rel="noopener noreferrer">translation repo</a>!</p>
<h2><a href="https://reactjs.org/blog/2019/02/23/is-react-translated-yet.html#backstory" rel="noopener noreferrer"></a>Backstory </h2>
<p>Hi everyone! I’m <a href="https://twitter.com/tesseralis" rel="noopener noreferrer">Nat</a>! You may know me as the <a href="https://www.youtube.com/watch?v=Ew-UzGC8RqQ" rel="noopener noreferrer">polyhedra lady</a>. For the past few weeks, I’ve been helping the React team coordinate their translation effort. Here’s how I did it.</p>
<p>Our original approach for translations was to use a SaaS platform that allows users to submit translations. There was already a <a href="https://github.com/reactjs/reactjs.org/pull/873" rel="noopener noreferrer">pull request</a> to integrate it and my original responsibility was to finish that integration. However, we had concerns about the feasibility of that integration and the current quality of translations on the platform. Our primary concern was ensuring that translations kept up to date with the main repo and didn’t become “stale”.</p>
<p><a href="https://twitter.com/dan_abramov" rel="noopener noreferrer">Dan</a> encouraged me to look for alternate solutions, and we stumbled across how <a href="https://vuejs.org/" rel="noopener noreferrer">Vue</a> maintained its translations — through different forks of the main repo on GitHub. In particular, the <a href="https://jp.vuejs.org/" rel="noopener noreferrer">Japanese translation</a> used a bot to periodically check for changes in the English repo and submits pull requests whenever there is a change.</p>
<p>This approach appealed to us for several reasons:</p>
<ul>
<li>It was less code integration to get off the ground.</li>
<li>It encouraged active maintainers for each repo to ensure quality.</li>
<li>Contributors already understand GitHub as a platform and are motivated to contribute directly to the React organization.</li>
</ul>
<p>We started off with an initial trial period of three languages: Spanish, Japanese, and Simplified Chinese. This allowed us to work out any kinks in our process and make sure future translations are set up for success. I wanted to give the translation teams freedom to choose whatever tools they felt comfortable with. The only requirement is a <a href="https://github.com/reactjs/reactjs.org-translation/blob/master/PROGRESS.template.md" rel="noopener noreferrer">checklist</a> that outlines the order of importance for translating pages. </p>
<p>After the trial period, we were ready to accept more languages. I created <a href="https://github.com/reactjs/reactjs.org-translation/blob/master/scripts/create.js" rel="noopener noreferrer">a script</a> to automate the creation of the new language repo, and a site, <a href="https://isreacttranslatedyet.com/" rel="noopener noreferrer">Is React Translated Yet?</a>, to track progress on the different translations. We started <em>10</em> new translations on our first day alone!</p>
<p>Because of the automation, the rest of the maintenance went mostly smoothly. We eventually created a <a href="https://rt-slack-invite.herokuapp.com/" rel="noopener noreferrer">Slack channel</a> to make it easier for translators to share information, and I released a guide solidifying the <a href="https://github.com/reactjs/reactjs.org-translation/blob/master/maintainer-guide.md" rel="noopener noreferrer">responsibilities of maintainers</a>. Allowing translators to talk with each other was a great boon — for example, the Arabic, Persian, and Hebrew translations were able to talk to each other in order to get <a href="https://en.wikipedia.org/wiki/Right-to-left" rel="noopener noreferrer">right-to-left text</a> working!</p>
<h2><a href="https://reactjs.org/blog/2019/02/23/is-react-translated-yet.html#the-bot" rel="noopener noreferrer"></a>The Bot </h2>
<p>The most challenging part was getting the bot to sync changes from the English version of the site. Initially we were using the <a href="https://github.com/vuejs-jp/che-tsumi" rel="noopener noreferrer">che-tsumi</a> bot created by the Japanese Vue translation team, but we soon decided to build our own bot to suit our needs. In particular, the che-tsumi bot works by <a href="https://git-scm.com/docs/git-cherry-pick" rel="noopener noreferrer">cherry picking</a> new commits. This ended up causing a cavalade of new issues that were interconnected, especially when <a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html" rel="noopener noreferrer">Hooks were released</a>.</p>
<p>In the end, we decided that instead of cherry picking each commit, it made more sense to merge all new commits and create a pull request around once a day. Conflicts are merged as-is and listed in the <a href="https://github.com/reactjs/pt-BR.reactjs.org/pull/114" rel="noopener noreferrer">pull request</a>, leaving a checklist for maintainers to fix.</p>
<p>Creating the <a href="https://github.com/reactjs/reactjs.org-translation/blob/master/scripts/sync.js" rel="noopener noreferrer">sync script</a> was easy enough: it downloads the translated repo, adds the original as a remote, pulls from it, merges the conflicts, and creates a pull request.</p>
<p>The problem was finding a place for the bot to run. I’m a frontend developer for a reason — Heroku and its ilk are alien to me and <em>endlessly</em> frustrating. In fact, until this past Tuesday, I was running the script by hand on my local machine!</p>
<p>The biggest challenge was space. Each fork of the repo is around 100MB — which takes minutes to clone on my local machine. We have <em>32</em> forks, and the free tiers or most deployment platforms I checked limited you to 512MB of storage. </p>
<p>After lots of notepad calculations, I found a solution: delete each repo once we’ve finished the script and limit the concurrency of <code>sync</code> scripts that run at once to be within the storage requirements. Luckily, Heroku dynos have a much faster Internet connection and are able to clone even the React repo quickly.</p>
<p>There were other smaller issues that I ran into. I tried using the <a href="https://elements.heroku.com/addons/scheduler" rel="noopener noreferrer">Heroku Scheduler</a> add-on so I didn’t have to write any actual <code>watch</code> code, but it end up running too inconsistently, and I <a href="https://twitter.com/tesseralis/status/1097387938088796160" rel="noopener noreferrer">had an existential meltdown on Twitter</a> when I couldn’t figure out how to send commits from the Heroku dyno. But in the end, this frontend engineer was able to get the bot working!</p>
<p>There are, as always, improvements I want to make to the bot. Right now it doesn’t check whether there is an outstanding pull request before pushing another one. It’s still hard to tell the exact change that happened in the original source, and it’s possible to miss out on a needed translation change. But I trust the maintainers we’ve chosen to work through these issues, and the bot is <a href="https://github.com/reactjs/reactjs.org-translation" rel="noopener noreferrer">open source</a> if anyone wants to help me make these improvements!</p>
<h2><a href="https://reactjs.org/blog/2019/02/23/is-react-translated-yet.html#thanks" rel="noopener noreferrer"></a>Thanks </h2>
<p>Finally, I would like to extend my gratitude to the following people and groups:</p>
<ul>
<li>All the translation maintainers and contributors who are helping translate React to more than thirty languages.</li>
<li>The <a href="https://github.com/vuejs-jp" rel="noopener noreferrer">Vue.js Japan User Group</a> for initiating the idea of having bot-managed translations, and especially <a href="https://github.com/potato4d" rel="noopener noreferrer">Hanatani Takuma</a> for helping us understand their approach and helping maintain the Japanese translation.</li>
<li><a href="https://github.com/smikitky" rel="noopener noreferrer">Soichiro Miki</a> for many <a href="https://github.com/reactjs/reactjs.org/pull/1636" rel="noopener noreferrer">contributions</a> and thoughtful comments on the overall translation process, as well as for maintaining the Japanese translation.</li>
<li><a href="https://github.com/ericnakagawa" rel="noopener noreferrer">Eric Nakagawa</a> for managing our previous translation process.</li>
<li><a href="https://github.com/bvaughn" rel="noopener noreferrer">Brian Vaughn</a> for setting up the <a href="https://reactjs.org/languages" rel="noopener noreferrer">languages page</a> and managing all the subdomains.</li>
</ul>
<p> And finally, thank you to <a href="https://twitter.com/dan_abramov" rel="noopener noreferrer">Dan Abramov</a> for giving me this opportunity and being a great mentor along the way.</p>', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (61, 4, 'https://reactjs.org/blog/2019/08/08/react-v16.9.0.html', 'React v16.9.0 and the Roadmap Update', '2019-08-08T00:00:00+00:00', 'Today we are releasing React 16.9. It contains several new features, bugfixes, and new deprecation warnings to help prepare for a future major release.
New Deprecations
Renaming Unsafe Lifecycle Methods
Over a year ago, we announced that unsafe lifecycle methods are getting renamed:

componentWillMount → UNSAFE_componentWillMount
componentWillReceiveProps → UNSAFE_componentWillReceiveProps
componentWillUpdate → UNSAFE_componentWillUpdate

React 16.9 does not contain breaking changes, and the old names continue to work in this release. But you will now see a warning when using any of the old names:

As the warning suggests, there are usually better approaches for each of the unsafe methods. However, maybe you don’t have the time to migrate or test these components. In that case, we recommend running a “codemod” script that renames them automatically:
cd your_project
npx react-codemod rename-unsafe-lifecycles
(Note that it says npx, not npm. npx is a utility that comes with Node 6+ by default.)
Running this codemod will replace the old names like componentWillMount with the new names like UNSAFE_componentWillMount:

The new names like UNSAFE_componentWillMount will keep working in both React 16.9 and in React 17.x. However, the new UNSAFE_ prefix will help components with problematic patterns stand out during the code review and debugging sessions. (If you’d like, you can further discourage their use inside your app with the opt-in Strict Mode.)

Note
Learn more about our versioning policy and commitment to stability.

Deprecating javascript: URLs
URLs starting with javascript: are a dangerous attack surface because it’s easy to accidentally include unsanitized output in a tag like &lt;a href&gt; and create a security hole:
const userProfile = {
  website: "javascript: alert(''you got hacked'')",
};
// This will now warn:
&lt;a href={userProfile.website}&gt;Profile&lt;/a&gt;
In React 16.9, this pattern continues to work, but it will log a warning. If you use javascript: URLs for logic, try to use React event handlers instead. (As a last resort, you can circumvent the protection with dangerouslySetInnerHTML, but it is highly discouraged and often leads to security holes.)
In a future major release, React will throw an error if it encounters a javascript: URL.
Deprecating “Factory” Components
Before compiling JavaScript classes with Babel became popular, React had support for a “factory” component that returns an object with a render method:
function FactoryComponent() {
  return { render() { return &lt;div /&gt;; } }
}
This pattern is confusing because it looks too much like a function component — but it isn’t one. (A function component would just return the &lt;div /&gt; in the above example.)
This pattern was almost never used in the wild, and supporting it causes React to be slightly larger and slower than necessary. So we are deprecating this pattern in 16.9 and logging a warning if it’s encountered. If you rely on it, adding FactoryComponent.prototype = React.Component.prototype can serve as a workaround. Alternatively, you can convert it to either a class or a function component.
We don’t expect most codebases to be affected by this.
New Features
Async act() for Testing
React 16.8 introduced a new testing utility called act() to help you write tests that better match the browser behavior. For example, multiple state updates inside a single act() get batched. This matches how React already works when handling real browser events, and helps prepare your components for the future in which React will batch updates more often.
However, in 16.8 act() only supported synchronous functions. Sometimes, you might have seen a warning like this in a test but could not easily fix it:
An update to SomeComponent inside a test was not wrapped in act(...).
In React 16.9, act() also accepts asynchronous functions, and you can await its call:
await act(async () =&gt; {
  // ...
});
This solves the remaining cases where you couldn’t use act() before, such as when the state update was inside an asynchronous function. As a result, you should be able to fix all the remaining act() warnings in your tests now.
We’ve heard there wasn’t enough information about how to write tests with act(). The new Testing Recipes guide describes common scenarios, and how act() can help you write good tests. These examples use vanilla DOM APIs, but you can also use React Testing Library to reduce the boilerplate code. Many of its methods already use act() internally.
Please let us know on the issue tracker if you bump into any other scenarios where act() doesn’t work well for you, and we’ll try to help.
Performance Measurements with &lt;React.Profiler&gt;
In React 16.5, we introduced a new React Profiler for DevTools that helps find performance bottlenecks in your application. In React 16.9, we are also adding a programmatic way to gather measurements called &lt;React.Profiler&gt;. We expect that most smaller apps won’t use it, but it can be handy to track performance regressions over time in larger apps.
The &lt;Profiler&gt; measures how often a React application renders and what the “cost” of rendering is. Its purpose is to help identify parts of an application that are slow and may benefit from optimizations such as memoization.
A &lt;Profiler&gt; can be added anywhere in a React tree to measure the cost of rendering that part of the tree.
It requires two props: an id (string) and an onRender callback (function) which React calls any time a component within the tree “commits” an update.
render(
  &lt;Profiler id="application" onRender={onRenderCallback}&gt;
    &lt;App&gt;
      &lt;Navigation {...props} /&gt;
      &lt;Main {...props} /&gt;
    &lt;/App&gt;
  &lt;/Profiler&gt;
);
 To learn more about the Profiler and the parameters passed to the onRender callback, check out the Profiler docs.

Note:
Profiling adds some additional overhead, so it is disabled in the production build.
To opt into production profiling, React provides a special production build with profiling enabled.
Read more about how to use this build at fb.me/react-profiling.

Notable Bugfixes
This release contains a few other notable improvements:


A crash when calling findDOMNode() inside a &lt;Suspense&gt; tree has been fixed.


A memory leak caused by retaining deleted subtrees has been fixed too.


An infinite loop caused by setState in useEffect now logs an error. (This is similar to the error you see when you call setState in componentDidUpdate in a class.)


We’re thankful to all the contributors who helped surface and fix these and other issues. You can find the full changelog below.
An Update to the Roadmap
In November 2018, we have posted this roadmap for the 16.x releases:

A minor 16.x release with React Hooks (past estimate: Q1 2019)
A minor 16.x release with Concurrent Mode (past estimate: Q2 2019)
A minor 16.x release with Suspense for Data Fetching (past estimate: mid 2019)

These estimates were too optimistic, and we’ve needed to adjust them.
tldr: We shipped Hooks on time, but we’re regrouping Concurrent Mode and Suspense for Data Fetching into a single release that we intend to release later this year.
In February, we shipped a stable 16.8 release including React Hooks, with React Native support coming a month later. However, we underestimated the follow-up work for this release, including the lint rules, developer tools, examples, and more documentation. This shifted the timeline by a few months.
Now that React Hooks are rolled out, the work on Concurrent Mode and Suspense for Data Fetching is in full swing. The new Facebook website that’s currently in active development is built on top of these features. Testing them with real code helped discover and address many issues before they can affect the open source users. Some of these fixes involved an internal redesign of these features, which has also caused the timeline to slip.
With this new understanding, here’s what we plan to do next.
One Release Instead of Two
Concurrent Mode and Suspense power the new Facebook website that’s in active development, so we are confident that they’re close to a stable state technically. We also now better understand the concrete steps before they are ready for open source adoption.
Originally we thought we would split Concurrent Mode and Suspense for Data Fetching into two releases. We’ve found that this sequencing is confusing to explain because these features are more related than we thought at first. So we plan to release support for both Concurrent Mode and Suspense for Data Fetching in a single combined release instead.
We don’t want to overpromise the release date again. Given that we rely on both of them in production code, we expect to provide a 16.x release with opt-in support for them this year.
An Update on Data Fetching
While React is not opinionated about how you fetch data, the first release of Suspense for Data Fetching will likely focus on integrating with opinionated data fetching libraries. For example, at Facebook we are using upcoming Relay APIs that integrate with Suspense. We will document how other opinionated libraries like Apollo can support a similar integration.
In the first release, we don’t intend to focus on the ad-hoc “fire an HTTP request” solution we used in earlier demos (also known as “React Cache”). However, we expect that both we and the React community will be exploring that space in the months after the initial release.
An Update on Server Rendering
We have started the work on the new Suspense-capable server renderer, but we don’t expect it to be ready for the initial release of Concurrent Mode. This release will, however, provide a temporary solution that lets the existing server renderer emit HTML for Suspense fallbacks immediately, and then render their real content on the client. This is the solution we are currently using at Facebook ourselves until the streaming renderer is ready.
Why Is It Taking So Long?
We’ve shipped the individual pieces leading up to Concurrent Mode as they became stable, including new context API, lazy loading with Suspense, and Hooks. We are also eager to release the other missing parts, but trying them at scale is an important part of the process. The honest answer is that it just took more work than we expected when we started. As always, we appreciate your questions and feedback on Twitter and in our issue tracker.
Installation
React
React v16.9.0 is available on the npm registry.
To install React 16 with Yarn, run:
yarn add react@^16.9.0 react-dom@^16.9.0
To install React 16 with npm, run:
npm install --save react@^16.9.0 react-dom@^16.9.0
We also provide UMD builds of React via a CDN:
&lt;script crossorigin src="https://unpkg.com/react@16/umd/react.production.min.js"&gt;&lt;/script&gt;
&lt;script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"&gt;&lt;/script&gt;
Refer to the documentation for detailed installation instructions.
Changelog
React

Add &lt;React.Profiler&gt; API for gathering performance measurements programmatically. (@bvaughn in #15172)
Remove unstable_ConcurrentMode in favor of unstable_createRoot. (@acdlite in #15532)

React DOM

Deprecate old names for the UNSAFE_* lifecycle methods. (@bvaughn in #15186 and @threepointone in #16103)
Deprecate javascript: URLs as a common attack surface. (@sebmarkbage in #15047)
Deprecate uncommon “module pattern” (factory) components. (@sebmarkbage in #15145)
Add support for the disablePictureInPicture attribute on &lt;video&gt;. (@eek in #15334)
Add support for onLoad event for &lt;embed&gt;. (@cherniavskii in #15614)
Add support for editing useState state from DevTools. (@bvaughn in #14906)
Add support for toggling Suspense from DevTools. (@gaearon in #15232)
Warn when setState is called from useEffect, creating a loop. (@gaearon in #15180)
Fix a memory leak. (@paulshen in #16115)
Fix a crash inside findDOMNode for components wrapped in &lt;Suspense&gt;. (@acdlite in #15312)
Fix pending effects from being flushed too late. (@acdlite in #15650)
Fix incorrect argument order in a warning message. (@brickspert in #15345)
Fix hiding Suspense fallback nodes when there is an !important style. (@acdlite in #15861 and #15882)
Slightly improve hydration performance. (@bmeurer in #15998)

React DOM Server

Fix incorrect output for camelCase custom CSS property names. (@bedakb in #16167)

React Test Utilities and Test Renderer

Add act(async () =&gt; ...) for testing asynchronous state updates. (@threepointone in #14853)
Add support for nesting act from different renderers. (@threepointone in #16039 and #16042)
Warn in Strict Mode if effects are scheduled outside an act() call. (@threepointone in #15763 and #16041)
Warn when using act from the wrong renderer. (@threepointone in #15756)
', '<p>Today we are releasing React 16.9. It contains several new features, bugfixes, and new deprecation warnings to help prepare for a future major release. </p>
<h2><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#new-deprecations" rel="noopener noreferrer"></a>New Deprecations </h2>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#renaming-unsafe-lifecycle-methods" rel="noopener noreferrer"></a>Renaming Unsafe Lifecycle Methods </h3>
<p><a href="https://reactjs.org/blog/2018/03/27/update-on-async-rendering.html" rel="noopener noreferrer">Over a year ago</a>, we announced that unsafe lifecycle methods are getting renamed:</p>
<ul>
<li><code>componentWillMount</code> → <code>UNSAFE_componentWillMount</code></li>
<li><code>componentWillReceiveProps</code> → <code>UNSAFE_componentWillReceiveProps</code></li>
<li><code>componentWillUpdate</code> → <code>UNSAFE_componentWillUpdate</code></li>
</ul>
<p><strong>React 16.9 does not contain breaking changes, and the old names continue to work in this release.</strong> But you will now see a warning when using any of the old names:</p>
<p><img src="https://i.imgur.com/sngxSML.png" alt="Warning: componentWillMount has been renamed, and is not recommended for use."></p>
<p>As the warning suggests, there are usually <a href="https://reactjs.org/blog/2018/03/27/update-on-async-rendering.html#migrating-from-legacy-lifecycles" rel="noopener noreferrer">better approaches</a> for each of the unsafe methods. However, maybe you don’t have the time to migrate or test these components. In that case, we recommend running a <a href="https://medium.com/@cpojer/effective-javascript-codemods-5a6686bb46fb" rel="noopener noreferrer">“codemod”</a> script that renames them automatically:</p>
<div><pre><code><span>cd</span> your_project
npx react-codemod rename-unsafe-lifecycles</code></pre></div>
<p><em>(Note that it says <code>npx</code>, not <code>npm</code>. <code>npx</code> is a utility that comes with Node 6+ by default.)</em></p>
<p>Running this codemod will replace the old names like <code>componentWillMount</code> with the new names like <code>UNSAFE_componentWillMount</code>:</p>
<p><img src="https://i.imgur.com/Heyvcyi.gif" alt="Codemod in action"></p>
<p>The new names like <code>UNSAFE_componentWillMount</code> <strong>will keep working in both React 16.9 and in React 17.x</strong>. However, the new <code>UNSAFE_</code> prefix will help components with problematic patterns stand out during the code review and debugging sessions. (If you’d like, you can further discourage their use inside your app with the opt-in <a href="https://reactjs.org/docs/strict-mode.html" rel="noopener noreferrer">Strict Mode</a>.)</p>
<blockquote>
<p>Note</p>
<p>Learn more about our <a href="https://reactjs.org/docs/faq-versioning.html#commitment-to-stability" rel="noopener noreferrer">versioning policy and commitment to stability</a>.</p>
</blockquote>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#deprecating-javascript-urls" rel="noopener noreferrer"></a>Deprecating <code>javascript:</code> URLs </h3>
<p>URLs starting with <code>javascript:</code> are a dangerous attack surface because it’s easy to accidentally include unsanitized output in a tag like <code>&lt;a href&gt;</code> and create a security hole:</p>
<div><pre><code><span>const</span> userProfile <span>=</span> <span>{</span>
  website<span>:</span> <span>"javascript: alert(''you got hacked'')"</span><span>,</span>
<span>}</span><span>;</span>
<span>// This will now warn:</span>
<span><span><span>&lt;</span>a</span> <span>href</span><span><span>=</span><span>{</span>userProfile<span>.</span>website<span>}</span></span><span>&gt;</span></span><span>Profile</span><span><span><span>&lt;/</span>a</span><span>&gt;</span></span></code></pre></div>
<p><strong>In React 16.9,</strong> this pattern continues to work, but it will log a warning. If you use <code>javascript:</code> URLs for logic, try to use React event handlers instead. (As a last resort, you can circumvent the protection with <a href="https://reactjs.org/docs/dom-elements.html#dangerouslysetinnerhtml" rel="noopener noreferrer"><code>dangerouslySetInnerHTML</code></a>, but it is highly discouraged and often leads to security holes.)</p>
<p><strong>In a future major release,</strong> React will throw an error if it encounters a <code>javascript:</code> URL.</p>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#deprecating-factory-components" rel="noopener noreferrer"></a>Deprecating “Factory” Components </h3>
<p>Before compiling JavaScript classes with Babel became popular, React had support for a “factory” component that returns an object with a <code>render</code> method:</p>
<div><pre><code><span>function</span> <span>FactoryComponent</span><span>(</span><span>)</span> <span>{</span>
  <span>return</span> <span>{</span> <span>render</span><span>(</span><span>)</span> <span>{</span> <span>return</span> <span><span><span>&lt;</span>div</span> <span>/&gt;</span></span><span>;</span> <span>}</span> <span>}</span>
<span>}</span></code></pre></div>
<p>This pattern is confusing because it looks too much like a function component — but it isn’t one. (A function component would just return the <code>&lt;div /&gt;</code> in the above example.)</p>
<p>This pattern was almost never used in the wild, and supporting it causes React to be slightly larger and slower than necessary. So we are deprecating this pattern in 16.9 and logging a warning if it’s encountered. If you rely on it, adding <code>FactoryComponent.prototype = React.Component.prototype</code> can serve as a workaround. Alternatively, you can convert it to either a class or a function component.</p>
<p>We don’t expect most codebases to be affected by this.</p>
<h2><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#new-features" rel="noopener noreferrer"></a>New Features </h2>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#async-act-for-testing" rel="noopener noreferrer"></a>Async <a href="https://reactjs.org/docs/test-utils.html#act" rel="noopener noreferrer"><code>act()</code></a> for Testing </h3>
<p><a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html" rel="noopener noreferrer">React 16.8</a> introduced a new testing utility called <a href="https://reactjs.org/docs/test-utils.html#act" rel="noopener noreferrer"><code>act()</code></a> to help you write tests that better match the browser behavior. For example, multiple state updates inside a single <code>act()</code> get batched. This matches how React already works when handling real browser events, and helps prepare your components for the future in which React will batch updates more often.</p>
<p>However, in 16.8 <code>act()</code> only supported synchronous functions. Sometimes, you might have seen a warning like this in a test but <a href="https://github.com/facebook/react/issues/14769" rel="noopener noreferrer">could not easily fix it</a>:</p>
<div><pre><code>An update to SomeComponent inside a test was not wrapped in act(...).</code></pre></div>
<p><strong>In React 16.9, <code>act()</code> also accepts asynchronous functions,</strong> and you can <code>await</code> its call:</p>
<div><pre><code><span>await</span> <span>act</span><span>(</span><span>async</span> <span>(</span><span>)</span> <span>=&gt;</span> <span>{</span>
  <span>// ...</span>
<span>}</span><span>)</span><span>;</span></code></pre></div>
<p>This solves the remaining cases where you couldn’t use <code>act()</code> before, such as when the state update was inside an asynchronous function. As a result, <strong>you should be able to fix all the remaining <code>act()</code> warnings in your tests now.</strong></p>
<p>We’ve heard there wasn’t enough information about how to write tests with <code>act()</code>. The new <a href="https://reactjs.org/docs/testing-recipes.html" rel="noopener noreferrer">Testing Recipes</a> guide describes common scenarios, and how <code>act()</code> can help you write good tests. These examples use vanilla DOM APIs, but you can also use <a href="https://testing-library.com/docs/react-testing-library/intro" rel="noopener noreferrer">React Testing Library</a> to reduce the boilerplate code. Many of its methods already use <code>act()</code> internally.</p>
<p>Please let us know <a href="https://github.com/facebook/react/issues" rel="noopener noreferrer">on the issue tracker</a> if you bump into any other scenarios where <code>act()</code> doesn’t work well for you, and we’ll try to help.</p>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#performance-measurements-with-reactprofiler" rel="noopener noreferrer"></a>Performance Measurements with <a href="https://reactjs.org/docs/profiler.html" rel="noopener noreferrer"><code>&lt;React.Profiler&gt;</code></a> </h3>
<p>In React 16.5, we introduced a new <a href="https://reactjs.org/blog/2018/09/10/introducing-the-react-profiler.html" rel="noopener noreferrer">React Profiler for DevTools</a> that helps find performance bottlenecks in your application. <strong>In React 16.9, we are also adding a <em>programmatic</em> way to gather measurements</strong> called <code>&lt;React.Profiler&gt;</code>. We expect that most smaller apps won’t use it, but it can be handy to track performance regressions over time in larger apps.</p>
<p>The <code>&lt;Profiler&gt;</code> measures how often a React application renders and what the “cost” of rendering is. Its purpose is to help identify parts of an application that are slow and may benefit from <a href="https://reactjs.org/docs/hooks-faq.html#how-to-memoize-calculations" rel="noopener noreferrer">optimizations such as memoization</a>.</p>
<p>A <code>&lt;Profiler&gt;</code> can be added anywhere in a React tree to measure the cost of rendering that part of the tree.
It requires two props: an <code>id</code> (string) and an <a href="https://reactjs.org/docs/profiler.html#onrender-callback" rel="noopener noreferrer"><code>onRender</code> callback</a> (function) which React calls any time a component within the tree “commits” an update.</p>
<div><pre><code><span>render</span><span>(</span>
<span>  <span><span><span>&lt;</span>Profiler</span> <span>id</span><span><span>=</span><span>"</span>application<span>"</span></span> <span>onRender</span><span><span>=</span><span>{</span>onRenderCallback<span>}</span></span><span>&gt;</span></span><span></span>
</span><span>    </span><span><span><span>&lt;</span>App</span><span>&gt;</span></span><span></span>
<span>      </span><span><span><span>&lt;</span>Navigation</span> <span><span>{</span><span>...</span><span>props</span><span>}</span></span> <span>/&gt;</span></span><span></span>
<span>      </span><span><span><span>&lt;</span>Main</span> <span><span>{</span><span>...</span><span>props</span><span>}</span></span> <span>/&gt;</span></span><span></span>
<span>    </span><span><span><span>&lt;/</span>App</span><span>&gt;</span></span><span></span>
<span><span>  </span><span><span><span>&lt;/</span>Profiler</span><span>&gt;</span></span>
</span><span>)</span><span>;</span></code></pre></div>
<p> To learn more about the <code>Profiler</code> and the parameters passed to the <code>onRender</code> callback, check out <a href="https://reactjs.org/docs/profiler.html" rel="noopener noreferrer">the <code>Profiler</code> docs</a>.</p>
<blockquote>
<p>Note:</p>
<p>Profiling adds some additional overhead, so <strong>it is disabled in <a href="https://reactjs.org/docs/optimizing-performance.html#use-the-production-build" rel="noopener noreferrer">the production build</a></strong>.</p>
<p>To opt into production profiling, React provides a special production build with profiling enabled.
Read more about how to use this build at <a href="https://fb.me/react-profiling" rel="noopener noreferrer">fb.me/react-profiling</a>.</p>
</blockquote>
<h2><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#notable-bugfixes" rel="noopener noreferrer"></a>Notable Bugfixes </h2>
<p>This release contains a few other notable improvements:</p>
<ul>
<li>
<p>A crash when calling <code>findDOMNode()</code> inside a <code>&lt;Suspense&gt;</code> tree <a href="https://github.com/facebook/react/pull/15312" rel="noopener noreferrer">has been fixed</a>.</p>
</li>
<li>
<p>A memory leak caused by retaining deleted subtrees <a href="https://github.com/facebook/react/pull/16115" rel="noopener noreferrer">has been fixed</a> too.</p>
</li>
<li>
<p>An infinite loop caused by <code>setState</code> in <code>useEffect</code> now <a href="https://github.com/facebook/react/pull/15180" rel="noopener noreferrer">logs an error</a>. (This is similar to the error you see when you call <code>setState</code> in <code>componentDidUpdate</code> in a class.)</p>
</li>
</ul>
<p>We’re thankful to all the contributors who helped surface and fix these and other issues. You can find the full changelog <a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#changelog" rel="noopener noreferrer">below</a>.</p>
<h2><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#an-update-to-the-roadmap" rel="noopener noreferrer"></a>An Update to the Roadmap </h2>
<p>In <a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html" rel="noopener noreferrer">November 2018</a>, we have posted this roadmap for the 16.x releases:</p>
<ul>
<li>A minor 16.x release with React Hooks (past estimate: Q1 2019)</li>
<li>A minor 16.x release with Concurrent Mode (past estimate: Q2 2019)</li>
<li>A minor 16.x release with Suspense for Data Fetching (past estimate: mid 2019)</li>
</ul>
<p>These estimates were too optimistic, and we’ve needed to adjust them.</p>
<p><strong>tldr:</strong> We shipped Hooks on time, but we’re regrouping Concurrent Mode and Suspense for Data Fetching into a single release that we intend to release later this year.</p>
<p>In February, we <a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html" rel="noopener noreferrer">shipped a stable 16.8 release</a> including React Hooks, with React Native support coming <a href="https://facebook.github.io/react-native/blog/2019/03/12/releasing-react-native-059" rel="noopener noreferrer">a month later</a>. However, we underestimated the follow-up work for this release, including the lint rules, developer tools, examples, and more documentation. This shifted the timeline by a few months.</p>
<p>Now that React Hooks are rolled out, the work on Concurrent Mode and Suspense for Data Fetching is in full swing. The <a href="https://twitter.com/facebook/status/1123322299418124289" rel="noopener noreferrer">new Facebook website that’s currently in active development</a> is built on top of these features. Testing them with real code helped discover and address many issues before they can affect the open source users. Some of these fixes involved an internal redesign of these features, which has also caused the timeline to slip.</p>
<p>With this new understanding, here’s what we plan to do next.</p>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#one-release-instead-of-two" rel="noopener noreferrer"></a>One Release Instead of Two </h3>
<p>Concurrent Mode and Suspense <a href="https://developers.facebook.com/videos/2019/building-the-new-facebookcom-with-react-graphql-and-relay/" rel="noopener noreferrer">power the new Facebook website</a> that’s in active development, so we are confident that they’re close to a stable state technically. We also now better understand the concrete steps before they are ready for open source adoption.</p>
<p>Originally we thought we would split Concurrent Mode and Suspense for Data Fetching into two releases. We’ve found that this sequencing is confusing to explain because these features are more related than we thought at first. So we plan to release support for both Concurrent Mode and Suspense for Data Fetching in a single combined release instead.</p>
<p>We don’t want to overpromise the release date again. Given that we rely on both of them in production code, we expect to provide a 16.x release with opt-in support for them this year.</p>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#an-update-on-data-fetching" rel="noopener noreferrer"></a>An Update on Data Fetching </h3>
<p>While React is not opinionated about how you fetch data, the first release of Suspense for Data Fetching will likely focus on integrating with <em>opinionated data fetching libraries</em>. For example, at Facebook we are using upcoming Relay APIs that integrate with Suspense. We will document how other opinionated libraries like Apollo can support a similar integration.</p>
<p>In the first release, we <em>don’t</em> intend to focus on the ad-hoc “fire an HTTP request” solution we used in earlier demos (also known as “React Cache”). However, we expect that both we and the React community will be exploring that space in the months after the initial release.</p>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#an-update-on-server-rendering" rel="noopener noreferrer"></a>An Update on Server Rendering </h3>
<p>We have started the work on the <a href="https://reactjs.org/blog/2018/11/27/react-16-roadmap.html#suspense-for-server-rendering" rel="noopener noreferrer">new Suspense-capable server renderer</a>, but we <em>don’t</em> expect it to be ready for the initial release of Concurrent Mode. This release will, however, provide a temporary solution that lets the existing server renderer emit HTML for Suspense fallbacks immediately, and then render their real content on the client. This is the solution we are currently using at Facebook ourselves until the streaming renderer is ready.</p>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#why-is-it-taking-so-long" rel="noopener noreferrer"></a>Why Is It Taking So Long? </h3>
<p>We’ve shipped the individual pieces leading up to Concurrent Mode as they became stable, including <a href="https://reactjs.org/blog/2018/03/29/react-v-16-3.html" rel="noopener noreferrer">new context API</a>, <a href="https://reactjs.org/blog/2018/10/23/react-v-16-6.html" rel="noopener noreferrer">lazy loading with Suspense</a>, and <a href="https://reactjs.org/blog/2019/02/06/react-v16.8.0.html" rel="noopener noreferrer">Hooks</a>. We are also eager to release the other missing parts, but <a href="https://reactjs.org/docs/design-principles.html#dogfooding" rel="noopener noreferrer">trying them at scale</a> is an important part of the process. The honest answer is that it just took more work than we expected when we started. As always, we appreciate your questions and feedback on <a href="https://twitter.com/reactjs" rel="noopener noreferrer">Twitter</a> and in our <a href="https://github.com/facebook/react/issues" rel="noopener noreferrer">issue tracker</a>.</p>
<h2><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#installation" rel="noopener noreferrer"></a>Installation </h2>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#react" rel="noopener noreferrer"></a>React </h3>
<p>React v16.9.0 is available on the npm registry.</p>
<p>To install React 16 with Yarn, run:</p>
<div><pre><code>yarn add react@^16.9.0 react-dom@^16.9.0</code></pre></div>
<p>To install React 16 with npm, run:</p>
<div><pre><code><span>npm</span> <span>install</span> --save react@^16.9.0 react-dom@^16.9.0</code></pre></div>
<p>We also provide UMD builds of React via a CDN:</p>
<div><pre><code><span><span><span>&lt;</span>script</span> <span>crossorigin</span> <span>src</span><span><span>=</span><span>"</span>https://unpkg.com/react@16/umd/react.production.min.js<span>"</span></span><span>&gt;</span></span><span></span><span><span><span>&lt;/</span>script</span><span>&gt;</span></span>
<span><span><span>&lt;</span>script</span> <span>crossorigin</span> <span>src</span><span><span>=</span><span>"</span>https://unpkg.com/react-dom@16/umd/react-dom.production.min.js<span>"</span></span><span>&gt;</span></span><span></span><span><span><span>&lt;/</span>script</span><span>&gt;</span></span></code></pre></div>
<p>Refer to the documentation for <a href="https://reactjs.org/docs/installation.html" rel="noopener noreferrer">detailed installation instructions</a>.</p>
<h2><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#changelog" rel="noopener noreferrer"></a>Changelog </h2>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#react" rel="noopener noreferrer"></a>React </h3>
<ul>
<li>Add <code>&lt;React.Profiler&gt;</code> API for gathering performance measurements programmatically. (<a href="https://github.com/bvaughn" rel="noopener noreferrer">@bvaughn</a> in <a href="https://github.com/facebook/react/pull/15172" rel="noopener noreferrer">#15172</a>)</li>
<li>Remove <code>unstable_ConcurrentMode</code> in favor of <code>unstable_createRoot</code>. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/15532" rel="noopener noreferrer">#15532</a>)</li>
</ul>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#react-dom" rel="noopener noreferrer"></a>React DOM </h3>
<ul>
<li>Deprecate old names for the <code>UNSAFE_*</code> lifecycle methods. (<a href="https://github.com/bvaughn" rel="noopener noreferrer">@bvaughn</a> in <a href="https://github.com/facebook/react/pull/15186" rel="noopener noreferrer">#15186</a> and <a href="https://github.com/threepointone" rel="noopener noreferrer">@threepointone</a> in <a href="https://github.com/facebook/react/pull/16103" rel="noopener noreferrer">#16103</a>)</li>
<li>Deprecate <code>javascript:</code> URLs as a common attack surface. (<a href="https://github.com/sebmarkbage" rel="noopener noreferrer">@sebmarkbage</a> in <a href="https://github.com/facebook/react/pull/15047" rel="noopener noreferrer">#15047</a>)</li>
<li>Deprecate uncommon “module pattern” (factory) components. (<a href="https://github.com/sebmarkbage" rel="noopener noreferrer">@sebmarkbage</a> in <a href="https://github.com/facebook/react/pull/15145" rel="noopener noreferrer">#15145</a>)</li>
<li>Add support for the <code>disablePictureInPicture</code> attribute on <code>&lt;video&gt;</code>. (<a href="https://github.com/eek" rel="noopener noreferrer">@eek</a> in <a href="https://github.com/facebook/react/pull/15334" rel="noopener noreferrer">#15334</a>)</li>
<li>Add support for <code>onLoad</code> event for <code>&lt;embed&gt;</code>. (<a href="https://github.com/cherniavskii" rel="noopener noreferrer">@cherniavskii</a> in <a href="https://github.com/facebook/react/pull/15614" rel="noopener noreferrer">#15614</a>)</li>
<li>Add support for editing <code>useState</code> state from DevTools. (<a href="https://github.com/bvaughn" rel="noopener noreferrer">@bvaughn</a> in <a href="https://github.com/facebook/react/pull/14906" rel="noopener noreferrer">#14906</a>)</li>
<li>Add support for toggling Suspense from DevTools. (<a href="https://github.com/gaearon" rel="noopener noreferrer">@gaearon</a> in <a href="https://github.com/facebook/react/pull/15232" rel="noopener noreferrer">#15232</a>)</li>
<li>Warn when <code>setState</code> is called from <code>useEffect</code>, creating a loop. (<a href="https://github.com/gaearon" rel="noopener noreferrer">@gaearon</a> in <a href="https://github.com/facebook/react/pull/15180" rel="noopener noreferrer">#15180</a>)</li>
<li>Fix a memory leak. (<a href="https://github.com/paulshen" rel="noopener noreferrer">@paulshen</a> in <a href="https://github.com/facebook/react/pull/16115" rel="noopener noreferrer">#16115</a>)</li>
<li>Fix a crash inside <code>findDOMNode</code> for components wrapped in <code>&lt;Suspense&gt;</code>. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/15312" rel="noopener noreferrer">#15312</a>)</li>
<li>Fix pending effects from being flushed too late. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/15650" rel="noopener noreferrer">#15650</a>)</li>
<li>Fix incorrect argument order in a warning message. (<a href="https://github.com/brickspert" rel="noopener noreferrer">@brickspert</a> in <a href="https://github.com/facebook/react/pull/15345" rel="noopener noreferrer">#15345</a>)</li>
<li>Fix hiding Suspense fallback nodes when there is an <code>!important</code> style. (<a href="https://github.com/acdlite" rel="noopener noreferrer">@acdlite</a> in <a href="https://github.com/facebook/react/pull/15861" rel="noopener noreferrer">#15861</a> and <a href="https://github.com/facebook/react/pull/15882" rel="noopener noreferrer">#15882</a>)</li>
<li>Slightly improve hydration performance. (<a href="https://github.com/bmeurer" rel="noopener noreferrer">@bmeurer</a> in <a href="https://github.com/facebook/react/pull/15998" rel="noopener noreferrer">#15998</a>)</li>
</ul>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#react-dom-server" rel="noopener noreferrer"></a>React DOM Server </h3>
<ul>
<li>Fix incorrect output for camelCase custom CSS property names. (<a href="https://github.com/bedakb" rel="noopener noreferrer">@bedakb</a> in <a href="https://github.com/facebook/react/pull/16167" rel="noopener noreferrer">#16167</a>)</li>
</ul>
<h3><a href="https://reactjs.org/blog/2019/08/08/react-v16.9.0.html#react-test-utilities-and-test-renderer" rel="noopener noreferrer"></a>React Test Utilities and Test Renderer </h3>
<ul>
<li>Add <code>act(async () =&gt; ...)</code> for testing asynchronous state updates. (<a href="https://github.com/threepointone" rel="noopener noreferrer">@threepointone</a> in <a href="https://github.com/facebook/react/pull/14853" rel="noopener noreferrer">#14853</a>)</li>
<li>Add support for nesting <code>act</code> from different renderers. (<a href="https://github.com/threepointone" rel="noopener noreferrer">@threepointone</a> in <a href="https://github.com/facebook/react/pull/16039" rel="noopener noreferrer">#16039</a> and <a href="https://github.com/facebook/react/pull/16042" rel="noopener noreferrer">#16042</a>)</li>
<li>Warn in Strict Mode if effects are scheduled outside an <code>act()</code> call. (<a href="https://github.com/threepointone" rel="noopener noreferrer">@threepointone</a> in <a href="https://github.com/facebook/react/pull/15763" rel="noopener noreferrer">#15763</a> and <a href="https://github.com/facebook/react/pull/16041" rel="noopener noreferrer">#16041</a>)</li>
<li>Warn when using <code>act</code> from the wrong renderer. (<a href="https://github.com/threepointone" rel="noopener noreferrer">@threepointone</a> in <a href="https://github.com/facebook/react/pull/15756" rel="noopener noreferrer">#15756</a>)</li>
</ul>', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (62, 4, 'https://reactjs.org/blog/2019/08/15/new-react-devtools.html', 'Introducing the New React DevTools', '2019-08-15T00:00:00+00:00', 'We are excited to announce a new release of the React Developer Tools, available today in Chrome, Firefox, and (Chromium) Edge!
What’s changed?
A lot has changed in version 4!
At a high level, this new version should offer significant performance gains and an improved navigation experience.
It also offers full support for React Hooks, including inspecting nested objects.











Visit the interactive tutorial to try out the new version or see the changelog for demo videos and more details.
Which versions of React are supported?
react-dom

0-14.x: Not supported
15.x: Supported (except for the new component filters feature)
16.x: Supported

react-native

0-0.61: Not supported
0.62: Will be supported (when 0.62 is released)

How do I get the new DevTools?
React DevTools is available as an extension for Chrome and Firefox.
If you have already installed the extension, it should update automatically within the next couple of hours.
If you use the standalone shell (e.g. in React Native or Safari), you can install the new version from NPM:
npm install -g react-devtools@^4
Where did all of the DOM elements go?
The new DevTools provides a way to filter components from the tree to make it easier to navigate deeply nested hierarchies.
Host nodes (e.g. HTML &lt;div&gt;, React Native &lt;View&gt;) are hidden by default, but this filter can be disabled:

How do I get the old version back?
If you are working with React Native version 60 (or older) you can install the previous release of DevTools from NPM:
npm install --dev react-devtools@^3
For older versions of React DOM (v0.14&nbsp;or earlier) you will need to build the extension from source:
# Checkout the extension source
git clone https://github.com/facebook/react-devtools

cd react-devtools

# Checkout the previous release branch
git checkout v3

# Install dependencies and build the unpacked extension
yarn install
yarn build:extension

# Follow the on-screen instructions to complete installation
Thank you!
We’d like to thank everyone who tested the early release of DevTools version 4.
Your feedback helped improve this initial release significantly.
We still have many exciting features planned and feedback is always welcome!
Please feel free to open a GitHub issue or tag @reactjs on Twitter.', '<p>We are excited to announce a new release of the React Developer Tools, available today in Chrome, Firefox, and (Chromium) Edge!</p>
<h2><a href="https://reactjs.org/blog/2019/08/15/new-react-devtools.html#whats-changed" rel="noopener noreferrer"></a>What’s changed? </h2>
<p>A lot has changed in version 4!
At a high level, this new version should offer significant performance gains and an improved navigation experience.
It also offers full support for React Hooks, including inspecting nested objects.</p>
<p>
  <a href="https://reactjs.org/static/devtools-v4-screenshot-9552e88d7605ef4e547af89096a9225d-b9896.png" rel="noopener noreferrer">

  <span>
    <span>
      <img alt="DevTools version 4 screenshot" title="" src="https://reactjs.org/static/devtools-v4-screenshot-9552e88d7605ef4e547af89096a9225d-acf85.png">
    </span>
  </span>

  </a>
    </p>
<p><a href="https://react-devtools-tutorial.now.sh/" rel="noopener noreferrer">Visit the interactive tutorial</a> to try out the new version or <a href="https://github.com/facebook/react/blob/master/packages/react-devtools/CHANGELOG.md#400-august-15-2019" rel="noopener noreferrer">see the changelog</a> for demo videos and more details.</p>
<h2><a href="https://reactjs.org/blog/2019/08/15/new-react-devtools.html#which-versions-of-react-are-supported" rel="noopener noreferrer"></a>Which versions of React are supported? </h2>
<p><strong><code>react-dom</code></strong></p>
<ul>
<li><code>0</code>-<code>14.x</code>: Not supported</li>
<li><code>15.x</code>: Supported (except for the new component filters feature)</li>
<li><code>16.x</code>: Supported</li>
</ul>
<p><strong><code>react-native</code></strong></p>
<ul>
<li><code>0</code>-<code>0.61</code>: Not supported</li>
<li><code>0.62</code>: Will be supported (when 0.62 is released)</li>
</ul>
<h2><a href="https://reactjs.org/blog/2019/08/15/new-react-devtools.html#how-do-i-get-the-new-devtools" rel="noopener noreferrer"></a>How do I get the new DevTools? </h2>
<p>React DevTools is available as an extension for <a href="https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en" rel="noopener noreferrer">Chrome</a> and <a href="https://addons.mozilla.org/en-US/firefox/addon/react-devtools/" rel="noopener noreferrer">Firefox</a>.
If you have already installed the extension, it should update automatically within the next couple of hours.</p>
<p>If you use the standalone shell (e.g. in React Native or Safari), you can install the new version <a href="https://www.npmjs.com/package/react-devtools" rel="noopener noreferrer">from NPM</a>:</p>
<div><pre><code><span>npm</span> <span>install</span> -g react-devtools@^4</code></pre></div>
<h2><a href="https://reactjs.org/blog/2019/08/15/new-react-devtools.html#where-did-all-of-the-dom-elements-go" rel="noopener noreferrer"></a>Where did all of the DOM elements go? </h2>
<p>The new DevTools provides a way to filter components from the tree to make it easier to navigate deeply nested hierarchies.
Host nodes (e.g. HTML <code>&lt;div&gt;</code>, React Native <code>&lt;View&gt;</code>) are <em>hidden by default</em>, but this filter can be disabled:</p>
<p><img src="https://reactjs.org/devtools-component-filters-758ea5ee734afdda4cd0f6b43c74fbb4.gif" alt="DevTools component filters"></p>
<h2><a href="https://reactjs.org/blog/2019/08/15/new-react-devtools.html#how-do-i-get-the-old-version-back" rel="noopener noreferrer"></a>How do I get the old version back? </h2>
<p>If you are working with React Native version 60 (or older) you can install the previous release of DevTools from NPM:</p>
<div><pre><code><span>npm</span> <span>install</span> --dev react-devtools@^3</code></pre></div>
<p>For older versions of React DOM (v0.14&nbsp;or earlier) you will need to build the extension from source:</p>
<div><pre><code><span># Checkout the extension source</span>
<span>git</span> clone https://github.com/facebook/react-devtools

<span>cd</span> react-devtools

<span># Checkout the previous release branch</span>
<span>git</span> checkout v3

<span># Install dependencies and build the unpacked extension</span>
yarn <span>install</span>
yarn build:extension

<span># Follow the on-screen instructions to complete installation</span></code></pre></div>
<h2><a href="https://reactjs.org/blog/2019/08/15/new-react-devtools.html#thank-you" rel="noopener noreferrer"></a>Thank you! </h2>
<p>We’d like to thank everyone who tested the early release of DevTools version 4.
Your feedback helped improve this initial release significantly.</p>
<p>We still have many exciting features planned and feedback is always welcome!
Please feel free to open a <a href="https://github.com/facebook/react/issues/new?labels=Component:%20Developer%20Tools" rel="noopener noreferrer">GitHub issue</a> or tag <a href="https://twitter.com/reactjs" rel="noopener noreferrer">@reactjs on Twitter</a>.</p>', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (63, 4, 'https://reactjs.org/blog/2019/10/22/react-release-channels.html', 'Preparing for the Future with React Prereleases', '2019-10-22T00:00:00+00:00', 'To share upcoming changes with our partners in the React ecosystem, we’re establishing official prerelease channels. We hope this process will help us make changes to React with confidence, and give developers the opportunity to try out experimental features.

This post will be most relevant to developers who work on frameworks, libraries, or developer tooling. Developers who use React primarily to build user-facing applications should not need to worry about our prerelease channels.

React relies on a thriving open source community to file bug reports, open pull requests, and submit RFCs. To encourage feedback, we sometimes share special builds of React that include unreleased features.
Because the source of truth for React is our public GitHub repository, it’s always been possible to build a copy of React that includes the latest changes. However it’s much easier for developers to install React from npm, so we occasionally publish prerelease builds to the npm registry. A recent example is the 16.7 alpha, which included an early version of the Hooks API.
We would like to make it even easier for developers to test prerelease builds of React, so we’re formalizing our process with three separate release channels.
Release Channels

The information in this post is also available on our Release Channels page. We will update that document whenever there are changes to our release process.

Each of React’s release channels is designed for a distinct use case:

Latest is for stable, semver React releases. It’s what you get when you install React from npm. This is the channel you’re already using today. Use this for all user-facing React applications.
Next tracks the master branch of the React source code repository. Think of these as release candidates for the next minor semver release. Use this for integration testing between React and third party projects.
Experimental includes experimental APIs and features that aren’t available in the stable releases. These also track the master branch, but with additional feature flags turned on. Use this to try out upcoming features before they are released.

All releases are published to npm, but only Latest uses semantic versioning. Prereleases (those in the Next and Experimental channels) have versions generated from a hash of their contents, e.g. 0.0.0-1022ee0ec for Next and 0.0.0-experimental-1022ee0ec for Experimental.
The only officially supported release channel for user-facing applications is Latest. Next and Experimental releases are provided for testing purposes only, and we provide no guarantees that behavior won’t change between releases. They do not follow the semver protocol that we use for releases from Latest.
By publishing prereleases to the same registry that we use for stable releases, we are able to take advantage of the many tools that support the npm workflow, like unpkg and CodeSandbox.
Latest Channel
Latest is the channel used for stable React releases. It corresponds to the latest tag on npm. It is the recommended channel for all React apps that are shipped to real users.
If you’re not sure which channel you should use, it’s Latest. If you’re a React developer, this is what you’re already using.
You can expect updates to Latest to be extremely stable. Versions follow the semantic versioning scheme. Learn more about our commitment to stability and incremental migration in our versioning policy.
Next Channel
The Next channel is a prerelease channel that tracks the master branch of the React repository. We use prereleases in the Next channel as release candidates for the Latest channel. You can think of Next as a superset of Latest that is updated more frequently.
The degree of change between the most recent Next release and the most recent Latest release is approximately the same as you would find between two minor semver releases. However, the Next channel does not conform to semantic versioning. You should expect occasional breaking changes between successive releases in the Next channel.
Do not use prereleases in user-facing applications.
Releases in Next are published with the next tag on npm. Versions are generated from a hash of the build’s contents, e.g. 0.0.0-1022ee0ec.
Using the Next Channel for Integration Testing
The Next channel is designed to support integration testing between React and other projects.
All changes to React go through extensive internal testing before they are released to the public. However, there are a myriad of environments and configurations used throughout the React ecosystem, and it’s not possible for us to test against every single one.
If you’re the author of a third party React framework, library, developer tool, or similar infrastructure-type project, you can help us keep React stable for your users and the entire React community by periodically running your test suite against the most recent changes. If you’re interested, follow these steps:


Set up a cron job using your preferred continuous integration platform. Cron jobs are supported by both CircleCI and Travis CI.


In the cron job, update your React packages to the most recent React release in the Next channel, using next tag on npm. Using the npm cli:
npm update react@next react-dom@next
Or yarn:
yarn upgrade react@next react-dom@next


Run your test suite against the updated packages.


If everything passes, great! You can expect that your project will work with the next minor React release.


If something breaks unexpectedly, please let us know by filing an issue.


A project that uses this workflow is Next.js. (No pun intended! Seriously!) You can refer to their CircleCI configuration as an example.
Experimental Channel
Like Next, the Experimental channel is a prerelease channel that tracks the master branch of the React repository. Unlike Next, Experimental releases include additional features and APIs that are not ready for wider release.
Usually, an update to Next is accompanied by a corresponding update to Experimental. They are based on the same source revision, but are built using a different set of feature flags.
Experimental releases may be significantly different than releases to Next and Latest. Do not use Experimental releases in user-facing applications. You should expect frequent breaking changes between releases in the Experimental channel.
Releases in Experimental are published with the experimental tag on npm. Versions are generated from a hash of the build’s contents, e.g. 0.0.0-experimental-1022ee0ec.
What Goes Into an Experimental Release?
Experimental features are ones that are not ready to be released to the wider public, and may change drastically before they are finalized. Some experiments may never be finalized — the reason we have experiments is to test the viability of proposed changes.
For example, if the Experimental channel had existed when we announced Hooks, we would have released Hooks to the Experimental channel weeks before they were available in Latest.
You may find it valuable to run integration tests against Experimental. This is up to you. However, be advised that Experimental is even less stable than Next. We do not guarantee any stability between Experimental releases.
How Can I Learn More About Experimental Features?
Experimental features may or may not be documented. Usually, experiments aren’t documented until they are close to shipping in Next or Stable.
If a feature is not documented, they may be accompanied by an RFC.
We will post to the React blog when we’re ready to announce new experiments, but that doesn’t mean we will publicize every experiment.
You can always refer to our public GitHub repository’s history for a comprehensive list of changes.', '<p>To share upcoming changes with our partners in the React ecosystem, we’re establishing official prerelease channels. We hope this process will help us make changes to React with confidence, and give developers the opportunity to try out experimental features.</p>
<blockquote>
<p>This post will be most relevant to developers who work on frameworks, libraries, or developer tooling. Developers who use React primarily to build user-facing applications should not need to worry about our prerelease channels.</p>
</blockquote>
<p>React relies on a thriving open source community to file bug reports, open pull requests, and <a href="https://github.com/reactjs/rfcs" rel="noopener noreferrer">submit RFCs</a>. To encourage feedback, we sometimes share special builds of React that include unreleased features.</p>
<p>Because the source of truth for React is our <a href="https://github.com/facebook/react" rel="noopener noreferrer">public GitHub repository</a>, it’s always been possible to build a copy of React that includes the latest changes. However it’s much easier for developers to install React from npm, so we occasionally publish prerelease builds to the npm registry. A recent example is the 16.7 alpha, which included an early version of the Hooks API.</p>
<p>We would like to make it even easier for developers to test prerelease builds of React, so we’re formalizing our process with three separate release channels.</p>
<h2><a href="https://reactjs.org/blog/2019/10/22/react-release-channels.html#release-channels" rel="noopener noreferrer"></a>Release Channels </h2>
<blockquote>
<p>The information in this post is also available on our <a href="https://reactjs.org/docs/release-channels.html" rel="noopener noreferrer">Release Channels</a> page. We will update that document whenever there are changes to our release process.</p>
</blockquote>
<p>Each of React’s release channels is designed for a distinct use case:</p>
<ul>
<li><a href="https://reactjs.org/blog/2019/10/22/react-release-channels.html#latest-channel" rel="noopener noreferrer"><strong>Latest</strong></a> is for stable, semver React releases. It’s what you get when you install React from npm. This is the channel you’re already using today. <strong>Use this for all user-facing React applications.</strong></li>
<li><a href="https://reactjs.org/blog/2019/10/22/react-release-channels.html#next-channel" rel="noopener noreferrer"><strong>Next</strong></a> tracks the master branch of the React source code repository. Think of these as release candidates for the next minor semver release. Use this for integration testing between React and third party projects.</li>
<li><a href="https://reactjs.org/blog/2019/10/22/react-release-channels.html#experimental-channel" rel="noopener noreferrer"><strong>Experimental</strong></a> includes experimental APIs and features that aren’t available in the stable releases. These also track the master branch, but with additional feature flags turned on. Use this to try out upcoming features before they are released.</li>
</ul>
<p>All releases are published to npm, but only Latest uses <a href="https://reactjs.org/docs/faq-versioning.html" rel="noopener noreferrer">semantic versioning</a>. Prereleases (those in the Next and Experimental channels) have versions generated from a hash of their contents, e.g. <code>0.0.0-1022ee0ec</code> for Next and <code>0.0.0-experimental-1022ee0ec</code> for Experimental.</p>
<p><strong>The only officially supported release channel for user-facing applications is Latest</strong>. Next and Experimental releases are provided for testing purposes only, and we provide no guarantees that behavior won’t change between releases. They do not follow the semver protocol that we use for releases from Latest.</p>
<p>By publishing prereleases to the same registry that we use for stable releases, we are able to take advantage of the many tools that support the npm workflow, like <a href="https://unpkg.com/" rel="noopener noreferrer">unpkg</a> and <a href="https://codesandbox.io/" rel="noopener noreferrer">CodeSandbox</a>.</p>
<h3><a href="https://reactjs.org/blog/2019/10/22/react-release-channels.html#latest-channel" rel="noopener noreferrer"></a>Latest Channel </h3>
<p>Latest is the channel used for stable React releases. It corresponds to the <code>latest</code> tag on npm. It is the recommended channel for all React apps that are shipped to real users.</p>
<p><strong>If you’re not sure which channel you should use, it’s Latest.</strong> If you’re a React developer, this is what you’re already using.</p>
<p>You can expect updates to Latest to be extremely stable. Versions follow the semantic versioning scheme. Learn more about our commitment to stability and incremental migration in our <a href="https://reactjs.org/docs/faq-versioning.html" rel="noopener noreferrer">versioning policy</a>.</p>
<h3><a href="https://reactjs.org/blog/2019/10/22/react-release-channels.html#next-channel" rel="noopener noreferrer"></a>Next Channel </h3>
<p>The Next channel is a prerelease channel that tracks the master branch of the React repository. We use prereleases in the Next channel as release candidates for the Latest channel. You can think of Next as a superset of Latest that is updated more frequently.</p>
<p>The degree of change between the most recent Next release and the most recent Latest release is approximately the same as you would find between two minor semver releases. However, <strong>the Next channel does not conform to semantic versioning.</strong> You should expect occasional breaking changes between successive releases in the Next channel.</p>
<p><strong>Do not use prereleases in user-facing applications.</strong></p>
<p>Releases in Next are published with the <code>next</code> tag on npm. Versions are generated from a hash of the build’s contents, e.g. <code>0.0.0-1022ee0ec</code>.</p>
<h4><a href="https://reactjs.org/blog/2019/10/22/react-release-channels.html#using-the-next-channel-for-integration-testing" rel="noopener noreferrer"></a>Using the Next Channel for Integration Testing </h4>
<p>The Next channel is designed to support integration testing between React and other projects.</p>
<p>All changes to React go through extensive internal testing before they are released to the public. However, there are a myriad of environments and configurations used throughout the React ecosystem, and it’s not possible for us to test against every single one.</p>
<p>If you’re the author of a third party React framework, library, developer tool, or similar infrastructure-type project, you can help us keep React stable for your users and the entire React community by periodically running your test suite against the most recent changes. If you’re interested, follow these steps:</p>
<ul>
<li>
<p>Set up a cron job using your preferred continuous integration platform. Cron jobs are supported by both <a href="https://circleci.com/docs/2.0/triggers/#scheduled-builds" rel="noopener noreferrer">CircleCI</a> and <a href="https://docs.travis-ci.com/user/cron-jobs/" rel="noopener noreferrer">Travis CI</a>.</p>
</li>
<li>
<p>In the cron job, update your React packages to the most recent React release in the Next channel, using <code>next</code> tag on npm. Using the npm cli:</p>
<div><pre><code>npm update react@next react-dom@next</code></pre></div>
<p>Or yarn:</p>
<div><pre><code>yarn upgrade react@next react-dom@next</code></pre></div>
</li>
<li>
<p>Run your test suite against the updated packages.</p>
</li>
<li>
<p>If everything passes, great! You can expect that your project will work with the next minor React release.</p>
</li>
<li>
<p>If something breaks unexpectedly, please let us know by <a href="https://github.com/facebook/react/issues" rel="noopener noreferrer">filing an issue</a>.</p>
</li>
</ul>
<p>A project that uses this workflow is Next.js. (No pun intended! Seriously!) You can refer to their <a href="https://github.com/zeit/next.js/blob/c0a1c0f93966fe33edd93fb53e5fafb0dcd80a9e/.circleci/config.yml" rel="noopener noreferrer">CircleCI configuration</a> as an example.</p>
<h3><a href="https://reactjs.org/blog/2019/10/22/react-release-channels.html#experimental-channel" rel="noopener noreferrer"></a>Experimental Channel </h3>
<p>Like Next, the Experimental channel is a prerelease channel that tracks the master branch of the React repository. Unlike Next, Experimental releases include additional features and APIs that are not ready for wider release.</p>
<p>Usually, an update to Next is accompanied by a corresponding update to Experimental. They are based on the same source revision, but are built using a different set of feature flags.</p>
<p>Experimental releases may be significantly different than releases to Next and Latest. <strong>Do not use Experimental releases in user-facing applications.</strong> You should expect frequent breaking changes between releases in the Experimental channel.</p>
<p>Releases in Experimental are published with the <code>experimental</code> tag on npm. Versions are generated from a hash of the build’s contents, e.g. <code>0.0.0-experimental-1022ee0ec</code>.</p>
<h4><a href="https://reactjs.org/blog/2019/10/22/react-release-channels.html#what-goes-into-an-experimental-release" rel="noopener noreferrer"></a>What Goes Into an Experimental Release? </h4>
<p>Experimental features are ones that are not ready to be released to the wider public, and may change drastically before they are finalized. Some experiments may never be finalized — the reason we have experiments is to test the viability of proposed changes.</p>
<p>For example, if the Experimental channel had existed when we announced Hooks, we would have released Hooks to the Experimental channel weeks before they were available in Latest.</p>
<p>You may find it valuable to run integration tests against Experimental. This is up to you. However, be advised that Experimental is even less stable than Next. <strong>We do not guarantee any stability between Experimental releases.</strong></p>
<h4><a href="https://reactjs.org/blog/2019/10/22/react-release-channels.html#how-can-i-learn-more-about-experimental-features" rel="noopener noreferrer"></a>How Can I Learn More About Experimental Features? </h4>
<p>Experimental features may or may not be documented. Usually, experiments aren’t documented until they are close to shipping in Next or Stable.</p>
<p>If a feature is not documented, they may be accompanied by an <a href="https://github.com/reactjs/rfcs" rel="noopener noreferrer">RFC</a>.</p>
<p>We will post to the React blog when we’re ready to announce new experiments, but that doesn’t mean we will publicize every experiment.</p>
<p>You can always refer to our public GitHub repository’s <a href="https://github.com/facebook/react/commits/master" rel="noopener noreferrer">history</a> for a comprehensive list of changes.</p>', null, null, null);
insert or ignore into posts (id, feed_id, link, title, date, summary, content, media_type, media_link, comments_link) VALUES (64, 4, 'https://reactjs.org/blog/2019/11/06/building-great-user-experiences-with-concurrent-mode-and-suspense.html', 'Building Great User Experiences with Concurrent Mode and Suspense', '2019-11-06T00:00:00+00:00', 'At React Conf 2019 we announced an experimental release of React that supports Concurrent Mode and Suspense. In this post we’ll introduce best practices for using them that we’ve identified through the process of building the new facebook.com.

This post will be most relevant to people working on data fetching libraries for React.
It shows how to best integrate them with Concurrent Mode and Suspense. The patterns introduced here are based on Relay — our library for building data-driven UIs with GraphQL. However, the ideas in this post apply to other GraphQL clients as well as libraries using REST or other approaches.

This post is aimed at library authors. If you’re primarily an application developer, you might still find some interesting ideas here, but don’t feel like you have to read it in its entirety.
Talk Videos
If you prefer to watch videos, some of the ideas from this blog post have been referenced in several React Conf 2019 presentations:

Data Fetching with Suspense in Relay by Joe Savona
Building the New Facebook with React and Relay by Ashley Watkins
React Conf Keynote by Yuzhi Zheng

This post presents a deeper dive on implementing a data fetching library with Suspense.
Putting User Experience First
The React team and community has long placed a deserved emphasis on developer experience: ensuring that React has good error messages, focusing on components as a way to reason locally about app behavior, crafting APIs that are predictable and encourage correct usage by design, etc. But we haven’t provided enough guidance on the best ways to achieve a great user experience in large apps.
For example, the React team has focused on framework performance and providing tools for developers to debug and tune application performance (e.g. React.memo). But we haven’t been as opinionated about the high-level patterns that make the difference between fast, fluid apps and slow, janky ones. We always want to ensure that React remains approachable to new users and supports a variety of use-cases — not every app has to be “blazing” fast. But as a community we can and should aim high. We should make it as easy as possible to build apps that start fast and stay fast, even as they grow in complexity, for users on varying devices and networks around the world.
Concurrent Mode and Suspense are experimental features that can help developers achieve this goal. We first introduced them at JSConf Iceland in 2018, intentionally sharing details very early to give the community time to digest the new concepts and to set the stage for subsequent changes. Since then we’ve completed related work, such as the new Context API and the introduction of Hooks, which are designed in part to help developers naturally write code that is more compatible with Concurrent Mode. But we didn’t want to implement these features and release them without validating that they work. So over the past year, the React, Relay, web infrastructure, and product teams at Facebook have all collaborated closely to build a new version of facebook.com that deeply integrates Concurrent Mode and Suspense to create an experience with a more fluid and app-like feel.
Thanks to this project, we’re more confident than ever that Concurrent Mode and Suspense can make it easier to deliver great, fast user experiences. But doing so requires rethinking how we approach loading code and data for our apps. Effectively all of the data-fetching on the new facebook.com is powered by Relay Hooks — new Hooks-based Relay APIs that integrate with Concurrent Mode and Suspense out of the box.
Relay Hooks — and GraphQL — won’t be for everyone, and that’s ok! Through our work on these APIs we’ve identified a set of more general patterns for using Suspense. Even if Relay isn’t the right fit for you, we think the key patterns we’ve introduced with Relay Hooks can be adapted to other frameworks.
Best Practices for Suspense
It’s tempting to focus only on the total startup time for an app — but it turns out that users’ perception of performance is determined by more than the absolute loading time. For example, when comparing two apps with the same absolute startup time, our research shows that users will generally perceive the one with fewer intermediate loading states and fewer layout changes as having loaded faster. Suspense is a powerful tool for carefully orchestrating an elegant loading sequence with a few, well-defined states that progressively reveal content. But improving perceived performance only goes so far — our apps still shouldn’t take forever to fetch all of their code, data, images, and other assets.
The traditional approach to loading data in React apps involves what we refer to as “fetch-on-render”. First we render a component with a spinner, then fetch data on mount (componentDidMount or useEffect), and finally update to render the resulting data. It’s certainly possible to use this pattern with Suspense: instead of initially rendering a placeholder itself, a component can “suspend” — indicate to React that it isn’t ready yet. This will tell React to find the nearest ancestor &lt;Suspense fallback={&lt;Placeholder/&gt;}&gt;, and render its fallback instead. If you watched earlier Suspense demos this example may feel familiar — it’s how we originally imagined using Suspense for data-fetching.
It turns out that this approach has some limitations. Consider a page that shows a social media post by a user, along with comments on that post. That might be structured as a &lt;Post&gt; component that renders both the post body and a &lt;CommentList&gt; to show the comments. Using the fetch-on-render approach described above to implement this could cause sequential round trips (sometimes referred to as a “waterfall”). First the data for the &lt;Post&gt; component would be fetched and then the data for &lt;CommentList&gt; would be fetched, increasing the time it takes to show the full page.
There’s also another often-overlooked downside to this approach. If &lt;Post&gt; eagerly requires (or imports) the &lt;CommentList&gt; component, our app will have to wait to show the post body while the code for the comments is downloading. We could lazily load &lt;CommentList&gt;, but then that would delay fetching comments data and increase the time to show the full page. How do we resolve this problem without compromising on the user experience?
Render As You Fetch
The fetch-on-render approach is widely used by React apps today and can certainly be used to create great apps. But can we do even better? Let’s step back and consider our goal.
In the above &lt;Post&gt; example, we’d ideally show the more important content — the post body — as early as possible, without negatively impacting the time to show the full page (including comments). Let’s consider the key constraints on any solution and look at how we can achieve them:

Showing the more important content (the post body) as early as possible means that we need to load the code and data for the view incrementally. We don’t want to block showing the post body on the code for &lt;CommentList&gt; being downloaded, for example.
At the same time we don’t want to increase the time to show the full page including comments. So we need to start loading the code and data for the comments as soon as possible, ideally in parallel with loading the post body.

This might sound difficult to achieve — but these constraints are actually incredibly helpful. They rule out a large number of approaches and spell out a solution for us. This brings us to the key patterns we’ve implemented in Relay Hooks, and that can be adapted to other data-fetching libraries. We’ll look at each one in turn and then see how they add up to achieve our goal of fast, delightful loading experiences:

Parallel data and view trees
Fetch in event handlers
Load data incrementally
Treat code like data

Parallel Data and View Trees
One of the most appealing things about the fetch-on-render pattern is that it colocates what data a component needs with how to render that data. This colocation is great — an example of how it makes sense to group code by concerns and not by technologies. All the issues we saw above were due to when we fetch data in this approach: upon rendering. We need to be able to fetch data before we’ve rendered the component. The only way to achieve that is by extracting the data dependencies into parallel data and view trees.
Here’s how that works in Relay Hooks. Continuing our example of a social media post with body and comments, here’s how we might define it with Relay Hooks:
// Post.js
function Post(props) {
  // Given a reference to some post - `props.post` - *what* data
  // do we need about that post?
  const postData = useFragment(graphql`
    fragment PostData on Post @refetchable(queryName: "PostQuery") {
      author
      title
      # ...  more fields ...
    }
  `, props.post);

  // Now that we have the data, how do we render it?
  return (
    &lt;div&gt;
      &lt;h1&gt;{postData.title}&lt;/h1&gt;
      &lt;h2&gt;by {postData.author}&lt;/h2&gt;
      {/* more fields  */}
    &lt;/div&gt;
  );
}
Although the GraphQL is written within the component, Relay has a build step (Relay Compiler) that extracts these data-dependencies into separate files and aggregates the GraphQL for each view into a single query. So we get the benefit of colocating concerns, while at runtime having parallel data and view trees. Other frameworks could achieve a similar effect by allowing developers to define data-fetching logic in a sibling file (maybe Post.data.js), or perhaps integrate with a bundler to allow defining data dependencies with UI code and automatically extracting it, similar to Relay Compiler.
The key is that regardless of the technology we’re using to load our data — GraphQL, REST, etc — we can separate what data to load from how and when to actually load it. But once we do that, how and when do we fetch our data?
Fetch in Event Handlers
Imagine that we’re about to navigate from a list of a user’s posts to the page for a specific post. We’ll need to download the code for that page — Post.js — and also fetch its data.
Waiting until we render the component has problems as we saw above. The key is to start fetching code and data for a new view in the same event handler that triggers showing that view. We can either fetch the data within our router — if our router supports preloading data for routes — or in the click event on the link that triggered the navigation. It turns out that the React Router folks are already hard at work on building APIs to support preloading data for routes. But other routing frameworks can implement this idea too.
Conceptually, we want every route definition to include two things: what component to render and what data to preload, as a function of the route/url params. Here’s what such a route definition might look like. This example is loosely inspired by React Router’s route definitions and is primarily intended to demonstrate the concept, not a specific API:
// PostRoute.js (GraphQL version)

// Relay generated query for loading Post data
import PostQuery from ''./__generated__/PostQuery.graphql'';

const PostRoute = {
  // a matching expression for which paths to handle
  path: ''/post/:id'',

  // what component to render for this route
  component: React.lazy(() =&gt; import(''./Post'')),

  // data to load for this route, as function of the route
  // parameters
  prepare: routeParams =&gt; {
    // Relay extracts queries from components, allowing us to reference
    // the data dependencies -- data tree -- from outside.
    const postData = preloadQuery(PostQuery, {
      postId: routeParams.id,
    });

    return { postData };
  },
};

export default PostRoute;
Given such a definition, a router can:

Match a URL to a route definition.
Call the prepare() function to start loading that route’s data. Note that prepare() is synchronous — we don’t wait for the data to be ready, since we want to start rendering more important parts of the view (like the post body) as quickly as possible.
Pass the preloaded data to the component. If the component is ready — the React.lazy dynamic import has completed — the component will render and try to access its data. If not, React.lazy will suspend until the code is ready.

This approach can be generalized to other data-fetching solutions. An app that uses REST might define a route like this:
// PostRoute.js (REST version)

// Manually written logic for loading the data for the component
import PostData from ''./Post.data'';

const PostRoute = {
  // a matching expression for which paths to handle
  path: ''/post/:id'',

  // what component to render for this route
  component: React.lazy(() =&gt; import(''./Post'')),

  // data to load for this route, as function of the route
  // parameters
  prepare: routeParams =&gt; {
    const postData = preloadRestEndpoint(
      PostData.endpointUrl,
      {
        postId: routeParams.id,
      },
    );
    return { postData };
  },
};

export default PostRoute;
This same approach can be employed not just for routing, but in other places where we show content lazily or based on user interaction. For example, a tab component could eagerly load the first tab’s code and data, and then use the same pattern as above to load the code and data for other tabs in the tab-change event handler. A component that displays a modal could preload the code and data for the modal in the click handler that triggers opening the modal, and so on.
Once we’ve implemented the ability to start loading code and data for a view independently, we have the option to go one step further. Consider a &lt;Link to={path} /&gt; component that links to a route. If the user hovers over that link, there’s a reasonable chance they’ll click it. And if they press the mouse down, there’s an even better chance that they’ll complete the click. If we can load code and data for a view after the user clicks, we can also start that work before they click, getting a head start on preparing the view.
Best of all, we can centralize that logic in a few key places — a router or core UI components — and get any performance benefits automatically throughout our app. Of course preloading isn’t always beneficial. It’s something an application would tune based on the user’s device or network speed to avoid eating up user’s data plans. But the pattern here makes it easier to centralize the implementation of preloading and the decision of whether to enable it or not.
Load Data Incrementally
The above patterns — parallel data/view trees and fetching in event handlers — let us start loading all the data for a view earlier. But we still want to be able to show more important parts of the view without waiting for all of our data. At Facebook we’ve implemented support for this in GraphQL and Relay in the form of some new GraphQL directives (annotations that affect how/when data is delivered, but not what data). These new directives, called @defer and @stream, allow us to retrieve data incrementally. For example, consider our &lt;Post&gt; component from above. We want to show the body without waiting for the comments to be ready. We can achieve this with @defer and &lt;Suspense&gt;:
// Post.js
function Post(props) {
  const postData = useFragment(graphql`
    fragment PostData on Post {
      author
      title

      # fetch data for the comments, but don''t block on it being ready
      ...CommentList @defer
    }
  `, props.post);

  return (
    &lt;div&gt;
      &lt;h1&gt;{postData.title}&lt;/h1&gt;
      &lt;h2&gt;by {postData.author}&lt;/h2&gt;
      {/* @defer pairs naturally with &lt;Suspense&gt; to make the UI non-blocking too */}
      &lt;Suspense fallback={&lt;Spinner/&gt;}&gt;
        &lt;CommentList post={postData} /&gt;
      &lt;/Suspense&gt;
    &lt;/div&gt;
  );
}
Here, our GraphQL server will stream back the results, first returning the author and title fields and then returning the comment data when it’s ready. We wrap &lt;CommentList&gt; in a &lt;Suspense&gt; boundary so that we can render the post body before &lt;CommentList&gt; and its data are ready. This same pattern can be applied to other frameworks as well. For example, apps that call a REST API might make parallel requests to fetch the body and comments data for a post to avoid blocking on all the data being ready.
Treat Code Like Data
But there’s one thing that’s still missing. We’ve shown how to preload data for a route — but what about code? The example above cheated a bit and used React.lazy. However, React.lazy is, as the name implies, lazy. It won’t start downloading code until the lazy component is actually rendered — it’s “fetch-on-render” for code!
To solve this, the React team is considering APIs that would allow bundle splitting and eager preloading for code as well. That would allow a user to pass some form of lazy component to a router, and for the router to trigger loading the code alongside its data as early as possible.
Putting It All Together
To recap, achieving a great loading experience means that we need to start loading code and data as early as possible, but without waiting for all of it to be ready. Parallel data and view trees allow us to load the data for a view in parallel with loading the view (code) itself. Fetching in an event handler means we can start loading data as early as possible, and even optimistically preload a view when we have enough confidence that a user will navigate to it. Loading data incrementally allows us to load important data earlier without delaying the fetching of less important data. And treating code as data — and preloading it with similar APIs — allows us to load it earlier too.
Using These Patterns
These patterns aren’t just ideas — we’ve implemented them in Relay Hooks and are using them in production throughout the new facebook.com (which is currently in beta testing). If you’re interested in using or learning more about these patterns, here are some resources:

The React Concurrent docs explore how to use Concurrent Mode and Suspense and go into more detail about many of these patterns. It’s a great resource to learn more about the APIs and use-cases they support.
The experimental release of Relay Hooks implements the patterns described here.

We’ve implemented two similar example apps that demonstrate these concepts:

The Relay Hooks example app uses GitHub’s public GraphQL API to implement a simple issue tracker app. It includes nested route support with code and data preloading. The code is fully commented — we encourage cloning the repo, running the app locally, and exploring how it works.
We also have a non-GraphQL version of the app that demonstrates how these concepts can be applied to other data-fetching libraries.



While the APIs around Concurrent Mode and Suspense are still experimental, we’re confident that the ideas in this post are proven by practice. However, we understand that Relay and GraphQL aren’t the right fit for everyone. That’s ok! We’re actively exploring how to generalize these patterns to approaches such as REST, and are exploring ideas for a more generic (ie non-GraphQL) API for composing a tree of data dependencies. In the meantime, we’re excited to see what new libraries will emerge that implement the patterns described in this post to make it easier to build great, fast user experiences.', '<p>At React Conf 2019 we announced an <a href="https://reactjs.org/docs/concurrent-mode-adoption.html#installation" rel="noopener noreferrer">experimental release</a> of React that supports Concurrent Mode and Suspense. In this post we’ll introduce best practices for using them that we’ve identified through the process of building <a href="https://twitter.com/facebook/status/1123322299418124289" rel="noopener noreferrer">the new facebook.com</a>.</p>
<blockquote>
<p>This post will be most relevant to people working on <em>data fetching libraries</em> for React. </p>
<p>It shows how to best integrate them with Concurrent Mode and Suspense. The patterns introduced here are based on <a href="https://relay.dev/docs/en/experimental/step-by-step" rel="noopener noreferrer">Relay</a> — our library for building data-driven UIs with GraphQL. However, the ideas in this post <strong>apply to other GraphQL clients as well as libraries using REST</strong> or other approaches.</p>
</blockquote>
<p>This post is <strong>aimed at library authors</strong>. If you’re primarily an application developer, you might still find some interesting ideas here, but don’t feel like you have to read it in its entirety.</p>
<h2><a href="https://reactjs.org/blog/2019/11/06/building-great-user-experiences-with-concurrent-mode-and-suspense.html#talk-videos" rel="noopener noreferrer"></a>Talk Videos </h2>
<p>If you prefer to watch videos, some of the ideas from this blog post have been referenced in several React Conf 2019 presentations:</p>
<ul>
<li><a href="https://www.youtube.com/watch?v=Tl0S7QkxFE4&amp;list=PLPxbbTqCLbGHPxZpw4xj_Wwg8-fdNxJRh&amp;index=15&amp;t=0s" rel="noopener noreferrer">Data Fetching with Suspense in Relay</a> by <a href="https://twitter.com/en_JS" rel="noopener noreferrer">Joe Savona</a></li>
<li><a href="https://www.youtube.com/watch?v=KT3XKDBZW7M&amp;list=PLPxbbTqCLbGHPxZpw4xj_Wwg8-fdNxJRh&amp;index=4" rel="noopener noreferrer">Building the New Facebook with React and Relay</a> by <a href="https://twitter.com/catchingash" rel="noopener noreferrer">Ashley Watkins</a></li>
<li><a href="https://www.youtube.com/watch?v=uXEEL9mrkAQ&amp;list=PLPxbbTqCLbGHPxZpw4xj_Wwg8-fdNxJRh&amp;index=2" rel="noopener noreferrer">React Conf Keynote</a> by <a href="https://twitter.com/yuzhiz" rel="noopener noreferrer">Yuzhi Zheng</a></li>
</ul>
<p>This post presents a deeper dive on implementing a data fetching library with Suspense.</p>
<h2><a href="https://reactjs.org/blog/2019/11/06/building-great-user-experiences-with-concurrent-mode-and-suspense.html#putting-user-experience-first" rel="noopener noreferrer"></a>Putting User Experience First </h2>
<p>The React team and community has long placed a deserved emphasis on developer experience: ensuring that React has good error messages, focusing on components as a way to reason locally about app behavior, crafting APIs that are predictable and encourage correct usage by design, etc. But we haven’t provided enough guidance on the best ways to achieve a great <em>user</em> experience in large apps.</p>
<p>For example, the React team has focused on <em>framework</em> performance and providing tools for developers to debug and tune application performance (e.g. <code>React.memo</code>). But we haven’t been as opinionated about the <em>high-level patterns</em> that make the difference between fast, fluid apps and slow, janky ones. We always want to ensure that React remains approachable to new users and supports a variety of use-cases — not every app has to be “blazing” fast. But as a community we can and should aim high. <strong>We should make it as easy as possible to build apps that start fast and stay fast,</strong> even as they grow in complexity, for users on varying devices and networks around the world. </p>
<p><a href="https://reactjs.org/docs/concurrent-mode-intro.html" rel="noopener noreferrer">Concurrent Mode</a> and <a href="https://reactjs.org/docs/concurrent-mode-suspense.html" rel="noopener noreferrer">Suspense</a> are experimental features that can help developers achieve this goal. We first introduced them at <a href="https://reactjs.org/blog/2018/03/01/sneak-peek-beyond-react-16.html" rel="noopener noreferrer">JSConf Iceland in 2018</a>, intentionally sharing details very early to give the community time to digest the new concepts and to set the stage for subsequent changes. Since then we’ve completed related work, such as the new Context API and the introduction of Hooks, which are designed in part to help developers naturally write code that is more compatible with Concurrent Mode. But we didn’t want to implement these features and release them without validating that they work. So over the past year, the React, Relay, web infrastructure, and product teams at Facebook have all collaborated closely to build a new version of facebook.com that deeply integrates Concurrent Mode and Suspense to create an experience with a more fluid and app-like feel. </p>
<p>Thanks to this project, we’re more confident than ever that Concurrent Mode and Suspense can make it easier to deliver great, <em>fast</em> user experiences. But doing so requires rethinking how we approach loading code and data for our apps. Effectively all of the data-fetching on the new facebook.com is powered by <a href="https://relay.dev/docs/en/experimental/step-by-step" rel="noopener noreferrer">Relay Hooks</a> — new Hooks-based Relay APIs that integrate with Concurrent Mode and Suspense out of the box.</p>
<p>Relay Hooks — and GraphQL — won’t be for everyone, and that’s ok! Through our work on these APIs we’ve identified a set of more general patterns for using Suspense. <strong>Even if Relay isn’t the right fit for you, we think the key patterns we’ve introduced with Relay Hooks can be adapted to other frameworks.</strong></p>
<h2><a href="https://reactjs.org/blog/2019/11/06/building-great-user-experiences-with-concurrent-mode-and-suspense.html#best-practices-for-suspense" rel="noopener noreferrer"></a>Best Practices for Suspense </h2>
<p>It’s tempting to focus only on the total startup time for an app — but it turns out that users’ perception of performance is determined by more than the absolute loading time. For example, when comparing two apps with the same absolute startup time, our research shows that users will generally perceive the one with fewer intermediate loading states and fewer layout changes as having loaded faster. Suspense is a powerful tool for carefully orchestrating an elegant loading sequence with a few, well-defined states that progressively reveal content. But improving perceived performance only goes so far — our apps still shouldn’t take forever to fetch all of their code, data, images, and other assets.</p>
<p>The traditional approach to loading data in React apps involves what we refer to as <a href="https://reactjs.org/docs/concurrent-mode-suspense.html#approach-1-fetch-on-render-not-using-suspense" rel="noopener noreferrer">“fetch-on-render”</a>. First we render a component with a spinner, then fetch data on mount (<code>componentDidMount</code> or <code>useEffect</code>), and finally update to render the resulting data. It’s certainly <em>possible</em> to use this pattern with Suspense: instead of initially rendering a placeholder itself, a component can “suspend” — indicate to React that it isn’t ready yet. This will tell React to find the nearest ancestor <code>&lt;Suspense fallback={&lt;Placeholder/&gt;}&gt;</code>, and render its fallback instead. If you watched earlier Suspense demos this example may feel familiar — it’s how we originally imagined using Suspense for data-fetching. </p>
<p>It turns out that this approach has some limitations. Consider a page that shows a social media post by a user, along with comments on that post. That might be structured as a <code>&lt;Post&gt;</code> component that renders both the post body and a <code>&lt;CommentList&gt;</code> to show the comments. Using the fetch-on-render approach described above to implement this could cause sequential round trips (sometimes referred to as a “waterfall”). First the data for the <code>&lt;Post&gt;</code> component would be fetched and then the data for <code>&lt;CommentList&gt;</code> would be fetched, increasing the time it takes to show the full page.</p>
<p>There’s also another often-overlooked downside to this approach. If <code>&lt;Post&gt;</code> eagerly requires (or imports) the <code>&lt;CommentList&gt;</code> component, our app will have to wait to show the post <em>body</em> while the code for the <em>comments</em> is downloading. We could lazily load <code>&lt;CommentList&gt;</code>, but then that would delay fetching comments data and increase the time to show the full page. How do we resolve this problem without compromising on the user experience?</p>
<h2><a href="https://reactjs.org/blog/2019/11/06/building-great-user-experiences-with-concurrent-mode-and-suspense.html#render-as-you-fetch" rel="noopener noreferrer"></a>Render As You Fetch </h2>
<p>The fetch-on-render approach is widely used by React apps today and can certainly be used to create great apps. But can we do even better? Let’s step back and consider our goal.</p>
<p>In the above <code>&lt;Post&gt;</code> example, we’d ideally show the more important content — the post body — as early as possible, <em>without</em> negatively impacting the time to show the full page (including comments). Let’s consider the key constraints on any solution and look at how we can achieve them:</p>
<ul>
<li>Showing the more important content (the post body) as early as possible means that we need to load the code and data for the view incrementally. We <em>don’t want to block showing the post body</em> on the code for <code>&lt;CommentList&gt;</code> being downloaded, for example.</li>
<li>At the same time we don’t want to increase the time to show the full page including comments. So we need to <em>start loading the code and data for the comments</em> as soon as possible, ideally <em>in parallel</em> with loading the post body.</li>
</ul>
<p>This might sound difficult to achieve — but these constraints are actually incredibly helpful. They rule out a large number of approaches and spell out a solution for us. This brings us to the key patterns we’ve implemented in Relay Hooks, and that can be adapted to other data-fetching libraries. We’ll look at each one in turn and then see how they add up to achieve our goal of fast, delightful loading experiences:</p>
<ol>
<li>Parallel data and view trees</li>
<li>Fetch in event handlers</li>
<li>Load data incrementally</li>
<li>Treat code like data</li>
</ol>
<h3><a href="https://reactjs.org/blog/2019/11/06/building-great-user-experiences-with-concurrent-mode-and-suspense.html#parallel-data-and-view-trees" rel="noopener noreferrer"></a>Parallel Data and View Trees </h3>
<p>One of the most appealing things about the fetch-on-render pattern is that it colocates <em>what</em> data a component needs with <em>how</em> to render that data. This colocation is great — an example of how it makes sense to group code by concerns and not by technologies. All the issues we saw above were due to <em>when</em> we fetch data in this approach: upon rendering. We need to be able to fetch data <em>before</em> we’ve rendered the component. The only way to achieve that is by extracting the data dependencies into parallel data and view trees. </p>
<p>Here’s how that works in Relay Hooks. Continuing our example of a social media post with body and comments, here’s how we might define it with Relay Hooks:</p>
<div><pre><code><span>// Post.js</span>
<span>function</span> <span>Post</span><span>(</span>props<span>)</span> <span>{</span>
  <span>// Given a reference to some post - `props.post` - *what* data</span>
  <span>// do we need about that post?</span>
  <span>const</span> postData <span>=</span> <span>useFragment</span><span>(</span>graphql<span><span>`
    fragment PostData on Post @refetchable(queryName: "PostQuery") {
      author
      title
      # ...  more fields ...
    }
  `</span></span><span>,</span> props<span>.</span>post<span>)</span><span>;</span>

  <span>// Now that we have the data, how do we render it?</span>
  <span>return</span> <span>(</span>
    <span><span><span>&lt;</span>div</span><span>&gt;</span></span><span>
      </span><span><span><span>&lt;</span>h1</span><span>&gt;</span></span><span>{</span>postData<span>.</span>title<span>}</span><span><span><span>&lt;/</span>h1</span><span>&gt;</span></span><span>
      </span><span><span><span>&lt;</span>h2</span><span>&gt;</span></span><span>by </span><span>{</span>postData<span>.</span>author<span>}</span><span><span><span>&lt;/</span>h2</span><span>&gt;</span></span><span>
      </span><span>{</span><span>/* more fields  */</span><span>}</span><span>
    </span><span><span><span>&lt;/</span>div</span><span>&gt;</span></span>
  <span>)</span><span>;</span>
<span>}</span></code></pre></div>
<p>Although the GraphQL is written within the component, Relay has a build step (Relay Compiler) that extracts these data-dependencies into separate files and aggregates the GraphQL for each view into a single query. So we get the benefit of colocating concerns, while at runtime having parallel data and view trees. Other frameworks could achieve a similar effect by allowing developers to define data-fetching logic in a sibling file (maybe <code>Post.data.js</code>), or perhaps integrate with a bundler to allow defining data dependencies with UI code and automatically extracting it, similar to Relay Compiler.</p>
<p>The key is that regardless of the technology we’re using to load our data — GraphQL, REST, etc — we can separate <em>what</em> data to load from how and when to actually load it. But once we do that, how and when <em>do</em> we fetch our data?</p>
<h3><a href="https://reactjs.org/blog/2019/11/06/building-great-user-experiences-with-concurrent-mode-and-suspense.html#fetch-in-event-handlers" rel="noopener noreferrer"></a>Fetch in Event Handlers </h3>
<p>Imagine that we’re about to navigate from a list of a user’s posts to the page for a specific post. We’ll need to download the code for that page — <code>Post.js</code> — and also fetch its data.</p>
<p>Waiting until we render the component has problems as we saw above. The key is to start fetching code and data for a new view <em>in the same event handler that triggers showing that view</em>. We can either fetch the data within our router — if our router supports preloading data for routes — or in the click event on the link that triggered the navigation. It turns out that the React Router folks are already hard at work on building APIs to support preloading data for routes. But other routing frameworks can implement this idea too. </p>
<p>Conceptually, we want every route definition to include two things: what component to render and what data to preload, as a function of the route/url params. Here’s what such a route definition <em>might</em> look like. This example is loosely inspired by React Router’s route definitions and is <em>primarily intended to demonstrate the concept, not a specific API</em>:</p>
<div><pre><code><span>// PostRoute.js (GraphQL version)</span>

<span>// Relay generated query for loading Post data</span>
<span>import</span> PostQuery <span>from</span> <span>''./__generated__/PostQuery.graphql''</span><span>;</span>

<span>const</span> PostRoute <span>=</span> <span>{</span>
  <span>// a matching expression for which paths to handle</span>
  path<span>:</span> <span>''/post/:id''</span><span>,</span>

  <span>// what component to render for this route</span>
  component<span>:</span> React<span>.</span><span>lazy</span><span>(</span><span>(</span><span>)</span> <span>=&gt;</span> <span>import</span><span>(</span><span>''./Post''</span><span>)</span><span>)</span><span>,</span>

  <span>// data to load for this route, as function of the route</span>
  <span>// parameters</span>
  prepare<span>:</span> routeParams <span>=&gt;</span> <span>{</span>
    <span>// Relay extracts queries from components, allowing us to reference</span>
    <span>// the data dependencies -- data tree -- from outside.</span>
    <span>const</span> postData <span>=</span> <span>preloadQuery</span><span>(</span>PostQuery<span>,</span> <span>{</span>
      postId<span>:</span> routeParams<span>.</span>id<span>,</span>
    <span>}</span><span>)</span><span>;</span>

    <span>return</span> <span>{</span> postData <span>}</span><span>;</span>
  <span>}</span><span>,</span>
<span>}</span><span>;</span>

<span>export</span> <span>default</span> PostRoute<span>;</span></code></pre></div>
<p>Given such a definition, a router can:</p>
<ul>
<li>Match a URL to a route definition.</li>
<li>Call the <code>prepare()</code> function to start loading that route’s data. Note that <code>prepare()</code> is synchronous — <em>we don’t wait for the data to be ready</em>, since we want to start rendering more important parts of the view (like the post body) as quickly as possible.</li>
<li>Pass the preloaded data to the component. If the component is ready — the <code>React.lazy</code> dynamic import has completed — the component will render and try to access its data. If not, <code>React.lazy</code> will suspend until the code is ready.</li>
</ul>
<p>This approach can be generalized to other data-fetching solutions. An app that uses REST might define a route like this:</p>
<div><pre><code><span>// PostRoute.js (REST version)</span>

<span>// Manually written logic for loading the data for the component</span>
<span>import</span> PostData <span>from</span> <span>''./Post.data''</span><span>;</span>

<span>const</span> PostRoute <span>=</span> <span>{</span>
  <span>// a matching expression for which paths to handle</span>
  path<span>:</span> <span>''/post/:id''</span><span>,</span>

  <span>// what component to render for this route</span>
  component<span>:</span> React<span>.</span><span>lazy</span><span>(</span><span>(</span><span>)</span> <span>=&gt;</span> <span>import</span><span>(</span><span>''./Post''</span><span>)</span><span>)</span><span>,</span>

  <span>// data to load for this route, as function of the route</span>
  <span>// parameters</span>
  prepare<span>:</span> routeParams <span>=&gt;</span> <span>{</span>
    <span>const</span> postData <span>=</span> <span>preloadRestEndpoint</span><span>(</span>
      PostData<span>.</span>endpointUrl<span>,</span>
      <span>{</span>
        postId<span>:</span> routeParams<span>.</span>id<span>,</span>
      <span>}</span><span>,</span>
    <span>)</span><span>;</span>
    <span>return</span> <span>{</span> postData <span>}</span><span>;</span>
  <span>}</span><span>,</span>
<span>}</span><span>;</span>

<span>export</span> <span>default</span> PostRoute<span>;</span></code></pre></div>
<p>This same approach can be employed not just for routing, but in other places where we show content lazily or based on user interaction. For example, a tab component could eagerly load the first tab’s code and data, and then use the same pattern as above to load the code and data for other tabs in the tab-change event handler. A component that displays a modal could preload the code and data for the modal in the click handler that triggers opening the modal, and so on. </p>
<p>Once we’ve implemented the ability to start loading code and data for a view independently, we have the option to go one step further. Consider a <code>&lt;Link to={path} /&gt;</code> component that links to a route. If the user hovers over that link, there’s a reasonable chance they’ll click it. And if they press the mouse down, there’s an even better chance that they’ll complete the click. If we can load code and data for a view <em>after</em> the user clicks, we can also start that work <em>before</em> they click, getting a head start on preparing the view.</p>
<p>Best of all, we can centralize that logic in a few key places — a router or core UI components — and get any performance benefits automatically throughout our app. Of course preloading isn’t always beneficial. It’s something an application would tune based on the user’s device or network speed to avoid eating up user’s data plans. But the pattern here makes it easier to centralize the implementation of preloading and the decision of whether to enable it or not.</p>
<h3><a href="https://reactjs.org/blog/2019/11/06/building-great-user-experiences-with-concurrent-mode-and-suspense.html#load-data-incrementally" rel="noopener noreferrer"></a>Load Data Incrementally </h3>
<p>The above patterns — parallel data/view trees and fetching in event handlers — let us start loading all the data for a view earlier. But we still want to be able to show more important parts of the view without waiting for <em>all</em> of our data. At Facebook we’ve implemented support for this in GraphQL and Relay in the form of some new GraphQL directives (annotations that affect how/when data is delivered, but not what data). These new directives, called <code>@defer</code> and <code>@stream</code>, allow us to retrieve data incrementally. For example, consider our <code>&lt;Post&gt;</code> component from above. We want to show the body without waiting for the comments to be ready. We can achieve this with <code>@defer</code> and <code>&lt;Suspense&gt;</code>:</p>
<div><pre><code><span>// Post.js</span>
<span>function</span> <span>Post</span><span>(</span>props<span>)</span> <span>{</span>
  <span>const</span> postData <span>=</span> <span>useFragment</span><span>(</span>graphql<span><span>`
    fragment PostData on Post {
      author
      title

      # fetch data for the comments, but don''t block on it being ready
      ...CommentList @defer
    }
  `</span></span><span>,</span> props<span>.</span>post<span>)</span><span>;</span>

  <span>return</span> <span>(</span>
    <span><span><span>&lt;</span>div</span><span>&gt;</span></span><span>
      </span><span><span><span>&lt;</span>h1</span><span>&gt;</span></span><span>{</span>postData<span>.</span>title<span>}</span><span><span><span>&lt;/</span>h1</span><span>&gt;</span></span><span>
      </span><span><span><span>&lt;</span>h2</span><span>&gt;</span></span><span>by </span><span>{</span>postData<span>.</span>author<span>}</span><span><span><span>&lt;/</span>h2</span><span>&gt;</span></span><span>
      </span><span>{</span><span>/* @defer pairs naturally with &lt;Suspense&gt; to make the UI non-blocking too */</span><span>}</span><span>
      </span><span><span><span>&lt;</span>Suspense</span> <span>fallback</span><span><span>=</span><span>{</span><span><span><span>&lt;</span>Spinner</span><span>/&gt;</span></span><span>}</span></span><span>&gt;</span></span><span>
        </span><span><span><span>&lt;</span>CommentList</span> <span>post</span><span><span>=</span><span>{</span>postData<span>}</span></span> <span>/&gt;</span></span><span>
      </span><span><span><span>&lt;/</span>Suspense</span><span>&gt;</span></span><span>
    </span><span><span><span>&lt;/</span>div</span><span>&gt;</span></span>
  <span>)</span><span>;</span>
<span>}</span></code></pre></div>
<p>Here, our GraphQL server will stream back the results, first returning the <code>author</code> and <code>title</code> fields and then returning the comment data when it’s ready. We wrap <code>&lt;CommentList&gt;</code> in a <code>&lt;Suspense&gt;</code> boundary so that we can render the post body before <code>&lt;CommentList&gt;</code> and its data are ready. This same pattern can be applied to other frameworks as well. For example, apps that call a REST API might make parallel requests to fetch the body and comments data for a post to avoid blocking on all the data being ready.</p>
<h3><a href="https://reactjs.org/blog/2019/11/06/building-great-user-experiences-with-concurrent-mode-and-suspense.html#treat-code-like-data" rel="noopener noreferrer"></a>Treat Code Like Data </h3>
<p>But there’s one thing that’s still missing. We’ve shown how to preload <em>data</em> for a route — but what about code? The example above cheated a bit and used <code>React.lazy</code>. However, <code>React.lazy</code> is, as the name implies, <em>lazy</em>. It won’t start downloading code until the lazy component is actually rendered — it’s “fetch-on-render” for code!</p>
<p>To solve this, the React team is considering APIs that would allow bundle splitting and eager preloading for code as well. That would allow a user to pass some form of lazy component to a router, and for the router to trigger loading the code alongside its data as early as possible.</p>
<h2><a href="https://reactjs.org/blog/2019/11/06/building-great-user-experiences-with-concurrent-mode-and-suspense.html#putting-it-all-together" rel="noopener noreferrer"></a>Putting It All Together </h2>
<p>To recap, achieving a great loading experience means that we need to <strong>start loading code and data as early as possible, but without waiting for all of it to be ready</strong>. Parallel data and view trees allow us to load the data for a view in parallel with loading the view (code) itself. Fetching in an event handler means we can start loading data as early as possible, and even optimistically preload a view when we have enough confidence that a user will navigate to it. Loading data incrementally allows us to load important data earlier without delaying the fetching of less important data. And treating code as data — and preloading it with similar APIs — allows us to load it earlier too.</p>
<h2><a href="https://reactjs.org/blog/2019/11/06/building-great-user-experiences-with-concurrent-mode-and-suspense.html#using-these-patterns" rel="noopener noreferrer"></a>Using These Patterns </h2>
<p>These patterns aren’t just ideas — we’ve implemented them in Relay Hooks and are using them in production throughout the new facebook.com (which is currently in beta testing). If you’re interested in using or learning more about these patterns, here are some resources:</p>
<ul>
<li>The <a href="https://reactjs.org/docs/concurrent-mode-intro.html" rel="noopener noreferrer">React Concurrent docs</a> explore how to use Concurrent Mode and Suspense and go into more detail about many of these patterns. It’s a great resource to learn more about the APIs and use-cases they support.</li>
<li>The <a href="https://relay.dev/docs/en/experimental/step-by-step" rel="noopener noreferrer">experimental release of Relay Hooks</a> implements the patterns described here. </li>
<li>
<p>We’ve implemented two similar example apps that demonstrate these concepts:</p>
<ul>
<li>The <a href="https://github.com/relayjs/relay-examples/tree/master/issue-tracker" rel="noopener noreferrer">Relay Hooks example app</a> uses GitHub’s public GraphQL API to implement a simple issue tracker app. It includes nested route support with code and data preloading. The code is fully commented — we encourage cloning the repo, running the app locally, and exploring how it works.</li>
<li>We also have a <a href="https://github.com/gaearon/suspense-experimental-github-demo" rel="noopener noreferrer">non-GraphQL version of the app</a> that demonstrates how these concepts can be applied to other data-fetching libraries.</li>
</ul>
</li>
</ul>
<p>While the APIs around Concurrent Mode and Suspense are <a href="https://reactjs.org/docs/concurrent-mode-adoption.html#who-is-this-experimental-release-for" rel="noopener noreferrer">still experimental</a>, we’re confident that the ideas in this post are proven by practice. However, we understand that Relay and GraphQL aren’t the right fit for everyone. That’s ok! <strong>We’re actively exploring how to generalize these patterns to approaches such as REST,</strong> and are exploring ideas for a more generic (ie non-GraphQL) API for composing a tree of data dependencies. In the meantime, we’re excited to see what new libraries will emerge that implement the patterns described in this post to make it easier to build great, <em>fast</em> user experiences.</p>', null, null, null);


insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (1, 1, 1, 0, 1, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (2, 1, 2, 0, 1, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (3, 1, 3, 0, 1, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (4, 1, 4, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (5, 1, 5, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (6, 1, 6, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (7, 1, 7, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (8, 1, 8, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (9, 1, 9, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (10, 1, 10, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (11, 1, 11, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (12, 1, 12, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (13, 1, 13, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (14, 1, 14, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (15, 1, 15, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (16, 1, 16, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (17, 1, 17, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (18, 1, 18, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (19, 1, 19, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (20, 1, 20, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (21, 1, 21, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (22, 1, 22, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (23, 1, 23, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (24, 1, 24, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (25, 1, 25, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (26, 1, 26, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (27, 1, 27, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (28, 1, 28, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (29, 1, 29, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (30, 1, 30, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (31, 1, 31, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (32, 1, 32, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (33, 1, 33, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (34, 1, 34, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (35, 1, 35, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (36, 1, 36, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (37, 1, 37, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (38, 1, 38, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (39, 1, 39, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (40, 1, 40, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (41, 1, 41, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (42, 1, 42, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (43, 1, 43, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (44, 1, 44, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (45, 1, 45, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (46, 1, 46, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (47, 1, 47, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (48, 1, 48, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (49, 1, 49, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (50, 1, 50, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (51, 1, 51, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (52, 1, 52, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (53, 1, 53, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (54, 1, 54, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (55, 1, 55, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (56, 1, 56, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (57, 1, 57, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (58, 1, 58, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (59, 1, 59, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (60, 1, 60, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (61, 1, 61, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (62, 1, 62, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (63, 1, 63, 0, 0, null);
insert or ignore into user_posts (id, user_id, post_id, is_read, is_read_later, read_date) VALUES (64, 1, 64, 0, 0, null);
