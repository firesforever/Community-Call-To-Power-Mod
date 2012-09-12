--SQL Template for updating civ dialogs
--Firesforever

-- This is the replacements for the Maya civ aka Ash
--General phrases
--Greeting (first time meeting)
UPDATE Language_en_US 		SET Text = 'My name is Ash and I am a slave. Close as I can figure, the year is thirteen hundred A.D and I am being dragged to my death. It wasnt always like this, I had a real life, once. A job'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_FIRSTGREETING_1';
UPDATE Language_en_US 		SET Text = 'Theres something out there. That... that witch in the cellar is only part of it. It lives... out in those woods, in the dark... something... something thats come back from the dead. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_FIRSTGREETING_2';
UPDATE Language_en_US 		SET Text = 'The names Ash. I had a wonderful girlfriend Linda. Together we drove to a small cabin in the mountains. It seems an archeologist had come to this remote place to translate and study his latest find: Necronomiconexmortis.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_FIRSTGREETING_3';
-- Reacts to his bluff being called 
UPDATE Language_en_US 		SET Text = 'Oh thats just what we call pillow talk, baby, thats all. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_WARBLUFF_1';
UPDATE Language_en_US 		SET Text = 'Aaaaaah! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_WARBLUFF_2';
UPDATE Language_en_US 		SET Text = 'Its a trick. Get an axe. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_WARBLUFF_3';
UPDATE Language_en_US 		SET Text = 'Work-shed!'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_WARBLUFF_4';
UPDATE Language_en_US 		SET Text = 'Baby, I aint holding your hand.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_WARBLUFF_5';
-- Gloats after winning a war 
UPDATE Language_en_US 		SET Text = 'Thats right... whos laughing now... whos laughing now? '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_WINWAR_1';
UPDATE Language_en_US 		SET Text = 'Hail to the king, baby.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_WINWAR_2';
-- Submissive after losing a war 
UPDATE Language_en_US 		SET Text = 'First you wanna kill me, now you wanna kiss me.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_LOSEWAR_1';
UPDATE Language_en_US 		SET Text = 'Gimme some sugar, baby.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_LOSEWAR_2';
-- Defeated and removed from game 
UPDATE Language_en_US 		SET Text = 'You bastards! You dirty bastards! Give me back my hand! Give me back my haaaaand!! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DEFEATED_1';
UPDATE Language_en_US 		SET Text = 'For Gods sake how do you stop it? '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DEFEATED_2';
UPDATE Language_en_US 		SET Text = 'You bastards! You dirty bastards! Give me back my hand! Give me back my haaaaand!!'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DEFEATED_3';
UPDATE Language_en_US 		SET Text = 'For Gods sake how do you stop it? '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DEFEATED_4';

-- Neutral 
-- Greetings (subsequent meetings) 
UPDATE Language_en_US 		SET Text = 'Whats the matter? Were you raised in a barn? Shut the door. Probably was raised in a barn with all the other primitives. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GREETING_1';
UPDATE Language_en_US 		SET Text = 'Dont touch that please, your primitive intellect wouldnt understand alloys and compositions and things with... molecular structures. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GREETING_2';
-- Goodbye 
UPDATE Language_en_US 		SET Text = 'I got it, I got it! I know your damn words, alright? '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GOODBYE_1';
UPDATE Language_en_US 		SET Text = 'Youre gonna learn to love me, missy. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GOODBYE_2';
-- Trade offer from player - yes 
UPDATE Language_en_US 		SET Text = 'Housewares.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_YES_NEUTRAL';
-- Trade offer from player - sweeten the deal 
UPDATE Language_en_US 		SET Text = 'Felt like someone just walked over my grave'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NEEDMORE_NEUTRAL_1';
UPDATE Language_en_US 		SET Text = 'Ah, crap that it?'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NEEDMORE_NEUTRAL_2';
UPDATE Language_en_US 		SET Text = 'Give me some more sugar!'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NEEDMORE_NEUTRAL_3';
UPDATE Language_en_US 		SET Text = 'S-Mart is closing if you dont improve that offer.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NEEDMORE_NEUTRAL_4';
-- Trade offer from player - no 
UPDATE Language_en_US 		SET Text = 'Aaaaaah!'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NO_NEUTRAL';
-- Demand for tribute from player - yes 
UPDATE Language_en_US 		SET Text = 'One look at you and I know why some animals eat their young. Take it.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRIBUTE_YES_NEUTRAL';
-- Demand for tribute from player - no 
UPDATE Language_en_US 		SET Text = 'Hey, wouldnt you just like to sit down and discuss our differences? No? Me neither '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRIBUTE_NO_NEUTRAL';
-- Requests a trade 
UPDATE Language_en_US 		SET Text = ' Boomstick: $199.99, Shells: 39.99, Zombies heads blowing off: priceless. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADEREQUEST_NEUTRAL';
-- Demands tribute 
UPDATE Language_en_US 		SET Text = 'Bet youre a believer in gun control now! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DEMANDTRIBUTE_NEUTRAL';
-- Agrees 
UPDATE Language_en_US 		SET Text = 'Yeah... truly amazing. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_AGREE_SHORT_1';
UPDATE Language_en_US 		SET Text = 'Amen to that, brother! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_AGREE_SHORT_2';
-- Disagrees 
UPDATE Language_en_US 		SET Text = 'Blow. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DISAGREE_SHORT_1';
UPDATE Language_en_US 		SET Text = 'Not Groovy'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DISAGREE_SHORT_2';
-- Let's hear it 
UPDATE Language_en_US 		SET Text = 'Hey buddy, whats on your mind? Oops, sorry - I forgot you need a head for that! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_LETSHEARIT_1';
UPDATE Language_en_US 		SET Text = 'So, tell me about yourself. Is there a Mrs Ugly to keep you cold at night? '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_LETSHEARIT_2';

-- Happy 
-- Greetings (subsequent meetings) 
UPDATE Language_en_US 		SET Text = 'Welcome! Remember hardware aisle twelve, shop smart, shop S-Mart! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GREETING_3';
UPDATE Language_en_US 		SET Text = 'Well arent you the sweetest little thing? '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GREETING_4';
-- Goodbye 
UPDATE Language_en_US 		SET Text = 'Gimme some sugar, baby. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GOODBYE_3';
UPDATE Language_en_US 		SET Text = 'Klaatu Barada N... Necktie... Neckturn... Nickel... Its an N word, its definitely an N word! Klaatu... Barada... N... '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GOODBYE_4';
-- Trade offer from player - yes 
UPDATE Language_en_US 		SET Text = 'Shop smart. Shop S-Mart'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_YES_HAPPY';
-- Trade offer from player - sweeten the deal 
UPDATE Language_en_US 		SET Text = 'Crazy is as crazy does, Baby. Now give me some more sugar. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NEEDMORE_HAPPY_1';
UPDATE Language_en_US 		SET Text = 'Come on baby you can do better than that.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NEEDMORE_HAPPY_2';
UPDATE Language_en_US 		SET Text = 'Okay... thats it?'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NEEDMORE_HAPPY_3';
-- Trade offer from player - no 
UPDATE Language_en_US 		SET Text = 'Nope. Just me baby... Just me. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NO_HAPPY';
-- Demand for tribute from player - yes 
UPDATE Language_en_US 		SET Text = 'Groovy'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRIBUTE_YES_HAPPY';
-- Demand for tribute from player - no 
UPDATE Language_en_US 		SET Text = 'Aah, dont get all mushy on me! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRIBUTE_NO_HAPPY';
-- Requests a trade 
UPDATE Language_en_US 		SET Text = 'Gimme some sugar, baby. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADEREQUEST_HAPPY';
-- Demands tribute 
UPDATE Language_en_US 		SET Text = 'Gimme some sugar, baby. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DEMANDTRIBUTE_HAPPY';
-- Agrees 
UPDATE Language_en_US 		SET Text = 'You did it kid... '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_AGREE_SHORT_3';
-- Disagrees 
UPDATE Language_en_US 		SET Text = 'No'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DISAGREE_SHORT_3';
UPDATE Language_en_US 		SET Text = 'No you idiot! Youll kill us all.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DISAGREE_SHORT_4';
-- Let's hear it 
UPDATE Language_en_US 		SET Text = 'Am listening'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_LETSHEARIT_3';
UPDATE Language_en_US 		SET Text = 'Hey, what do you say we have some champagne, huh, baby? '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_LETSHEARIT_4';

-- Angry 
-- Greetings (subsequent meetings) 
UPDATE Language_en_US 		SET Text = 'Well hello Mr. Fancy-pants. I got news for you pal, you aint leadin but two things right now. Jack and shit... and Jack left town.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GREETING_5';
UPDATE Language_en_US 		SET Text = 'Honey, you got reeeal ugly! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GREETING_6';
-- Goodbye 
UPDATE Language_en_US 		SET Text = 'Thats it, go ahead and run. Run home and cry to mama! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GOODBYE_5';
UPDATE Language_en_US 		SET Text = 'Old double barrel here, blow your butts to kingdom come. See if we dont.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_GOODBYE_6';
-- Trade offer from player - yes 
UPDATE Language_en_US 		SET Text = 'Thank you for shopping at Ass Woopings Are Us. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_YES_ANGRY';
-- Trade offer from player - sweeten the deal 
UPDATE Language_en_US 		SET Text = 'Come on, whats a little death? '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NEEDMORE_ANGRY_1';
UPDATE Language_en_US 		SET Text = 'Oh great! An optimist with a gun! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NEEDMORE_ANGRY_2';
UPDATE Language_en_US 		SET Text = 'Whoa! Where you born that ugly?'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NEEDMORE_ANGRY_3';
UPDATE Language_en_US 		SET Text = 'No way'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NEEDMORE_ANGRY_4';
-- Trade offer from player - no 
UPDATE Language_en_US 		SET Text = ' I dont want your book, I dont want your bullshit.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADE_NO_ANGRY';
-- Demand for tribute from player - yes 
UPDATE Language_en_US 		SET Text = 'You bastards, why are you torturing me like this? Why? '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRIBUTE_YES_ANGRY';
-- Demand for tribute from player - no 
UPDATE Language_en_US 		SET Text = 'Keep your damn filthy bones outta my mouth'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRIBUTE_NO_ANGRY';
-- Requests a trade 
UPDATE Language_en_US 		SET Text = 'Alright you Primitive Screwhead, listen up!'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_TRADEREQUEST_ANGRY';
-- Demands tribute 
UPDATE Language_en_US 		SET Text = 'Good. Bad. Im the guy with the gun.'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DEMANDTRIBUTE_ANGRY';
-- Agrees 
UPDATE Language_en_US 		SET Text = 'Ok - for a freak! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_AGREE_SHORT_4';
-- Disagrees 
UPDATE Language_en_US 		SET Text = 'Youre pissing me off, you ugly son of a bitch! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DISAGREE_SHORT_5';
UPDATE Language_en_US 		SET Text = 'Blow. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DISAGREE_SHORT_6';
UPDATE Language_en_US 		SET Text = 'No. Nooo, Noooo... noooo! NOOOOOO! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DISAGREE_SHORT_7';
-- Let's hear it 
UPDATE Language_en_US 		SET Text = 'What do we have here, another poster boy for birth control? Am listening '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_LETSHEARIT_5';


-- Declare War
UPDATE Language_en_US 		SET Text = 'Youre going down. Chainsaw. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DECLAREWAR_1';
UPDATE Language_en_US 		SET Text = 'Im Bad Ash. And youre Good Ash. Youre goody little two shoes. Youre goody little two shoes. Goody little two shoes. Little goody two shoes. Little goody two shoes. Little goody two shoes. Little goody two shoes. Little goody two shoes. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DECLAREWAR_2';
UPDATE Language_en_US 		SET Text = 'Hey, whats that you got on your face? '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_DECLAREWAR_3';
-- Attacked
UPDATE Language_en_US 		SET Text = 'Oh, dear God, its growing bigger! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_ATTACKED_1';
UPDATE Language_en_US 		SET Text = 'Oh you little bastards! All right, Ill crush each and every last one of ya! Ill squash you so hard youll have to look down to look up!'		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_ATTACKED_2';
UPDATE Language_en_US 		SET Text = 'Ill spoil those good looks back stabber. '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_ATTACKED_3';
UPDATE Language_en_US 		SET Text = 'Youre going DOWN! '		
WHERE Tag = 'TXT_KEY_LEADER_PACAL_ATTACKED_4';
