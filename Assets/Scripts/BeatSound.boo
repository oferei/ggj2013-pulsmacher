import UnityEngine
#import System.Collections

[RequireComponent(AudioSource)]

class BeatSound (MonoBehaviour): 

	public clip1 as AudioClip
	public volume1 as single = 0.5
	public clip2 as AudioClip
	public volume2 as single = 0.25
	public delay as single = 0.3
	
	def OnEnable ():
		God.Inst.Hermes.Listen(MessageHeartBeat, self)
		God.Inst.Hermes.Listen(MessageHeartBeat2, self)

	def OnDisable ():
		God.Inst.Hermes.StopListening(MessageHeartBeat, self)
		God.Inst.Hermes.StopListening(MessageHeartBeat2, self)
		
	def OnMsgHeartBeat (msg as MessageHeartBeat):
		audio.clip = clip1
		audio.volume = volume1
		audio.Play()
	
	def OnMsgHeartBeat2 (msg as MessageHeartBeat2):
		audio.clip = clip2
		audio.volume = volume2
		audio.Play()
	
/*	def Play() as IEnumerator:
		audio.clip = clip1
		audio.volume = volume1
		audio.Play()
		yield WaitForSeconds(delay)
		audio.clip = clip2
		audio.volume = volume2
		audio.Play()
*/