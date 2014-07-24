import UnityEngine

class ScoreUpkeep (MonoBehaviour): 

	public _scoreText as GUIText
	
	def Start ():
		pass
	
	def OnEnable ():
		God.Inst.Hermes.Listen(MessageScore, self)

	def OnDisable ():
		God.Inst.Hermes.StopListening(MessageScore, self)
		
	def OnMsgScore (msg as MessageScore):
		_scoreText.text = msg.Score.ToString()
		
	def Update ():
		pass