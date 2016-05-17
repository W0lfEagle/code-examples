Project version as submitted for uni final project 
Current version potentially owned by another party
Intended as code demo only

Deployment of this version at 
Teacher: https://uol-final-project.herokuapp.com/teacherroom
Student: https://uol-final-project.herokuapp.com/studentroom

Open one of each
Accept camera and microphone 
WebRTC connection sets itself up automatically using websockets
If connection made, call button on teacher side turns green - press it
Call made (hopefully)
Teacher can insert content into the lesson
Blocks and functions - 
	Reading - 	student side - double click to highlight and start disctionary service using Yandex translate API
			teacher side - word shown as label at bottom
			word added to dynamic vocabulary block
	Conversation - 	static content
	Vocabulary - 	either static or dynamically built using selected words
	Video - 	YouTube Iframe API
			teacher side - synchronised playback controls
	Image - 	teacher search for image using BigStock API
			teacher sends to student
			Student side - images displayed
Text chat - over webRTC using data channel
webRTC messages also used for control messages - adding and removing content from the scope etc.

Incomplete file structure 

Virtual Classroom built specifically for language students and tutors

Modular Angular app designed to allow new blocks of content to be developed and incorporated easily

Project Abstract
While a range of virtual classroom solutions are available, a distinct lack of one designed specifically for language learners was the main motivation for the initiation of this study. The aims are to identify the specific needs of language teachers and students and to provide a new solution which meets those needs. Language tuition is one of the fastest growing online industries driven by a global demand for English proficiency in the workplace. 
The requirements gathered from 62 users are presented in this report as the foundations of the prototype developed. Combined with a critical review of existing solutions, these requirements are further developed into design specifications and further again into a fully functional prototype virtual language classroom built primarily with Node and AnglularJS. The positive results of testing this prototype among a smaller group of users are discussed and recommendations for further development are provided.

Currently working on:
Update to Angular 2, ES6 and Bootstrap 4
NLP - quiz generation
Angular animations 
Testing with Protrator and Jasmine
Security
Call initiation logic
New Blocks: Grammar rules, sentence complete exercises