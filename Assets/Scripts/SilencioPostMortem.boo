import UnityEngine

class SilencioPostMortem (MonoBehaviour): 

	def OnEnable ():
		God.Inst.Hermes.Listen(MessageDead, self)

	def OnDisable ():
		God.Inst.Hermes.StopListening(MessageDead, self)
		
	def OnMsgDead (msg as MessageDead):
		audio.Stop()
