import UnityEngine
#import System.Collections

[RequireComponent(Animation)]

class Quake (MonoBehaviour): 
	
	public height as single = 50
	
	/*
	def Start():
		curve as AnimationCurve = AnimationCurve.Linear(1, 0, 2, 500)
		clip as AnimationClip = AnimationClip()
		clip.SetCurve('', Transform, 'localPosition.y', curve)
		animation.AddClip(clip, 'test')
		animation.Play('test')
		*/

	def OnEnable ():
		God.Inst.Hermes.Listen(MessageHeartBeat, self)
		God.Inst.Hermes.Listen(MessageHeartBeat2, self)

	def OnDisable ():
		God.Inst.Hermes.StopListening(MessageHeartBeat, self)
		God.Inst.Hermes.StopListening(MessageHeartBeat2, self)
		
	def OnMsgHeartBeat (msg as MessageHeartBeat):
		#Debug.Log("*** anim")
		#animation.wrapMode = WrapMode.Once
		#animation.Play('test')
		#transform.position.y -= height
		animation.Stop()
		animation.Play()
	
	def OnMsgHeartBeat2 (msg as MessageHeartBeat2):
		pass
		#transform.position.y += height
