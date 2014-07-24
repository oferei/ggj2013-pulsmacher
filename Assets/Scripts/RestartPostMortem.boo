import UnityEngine

class RestartPostMortem (MonoBehaviour): 

	public msg as GUIText
	public canRestartDelay as single = 2
	public showMessageDelay as single = 7
		
	dead = false

	def OnEnable ():
		God.Inst.Hermes.Listen(MessageDead, self)

	def OnDisable ():
		God.Inst.Hermes.StopListening(MessageDead, self)
		
	def OnMsgDead (msg as MessageDead):
		Invoke("MakeMeDead", canRestartDelay)
		Invoke("ShowMessage", showMessageDelay)
	
	def MakeMeDead():
		dead = true
		
	def ShowMessage():
		msg.enabled = true
	
	def Update ():
		if dead and Input.GetButtonDown("Jump"):
			Application.LoadLevel(1)
