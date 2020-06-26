# iOS13CCProblem
This is sample app to proving that closed caption broke after implementing background audio as explained in
https://developer.apple.com/documentation/avfoundation/media_playback_and_selection/creating_a_basic_video_player_ios_and_tvos/enabling_background_audio and 
https://developer.apple.com/documentation/avfoundation/media_playback_and_selection/creating_a_basic_video_player_ios_and_tvos/playing_audio_from_a_video_asset_in_the_background. 
iOS 12 not affected by this bug

How to reproduce :

Open any video, play and wait until CC appear, go to background sound will still playing.
Open app again (go to foreground), CC will disappear even if it should showing CC.
