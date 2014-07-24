import UnityEngine

class ScoreBroadcast (MonoBehaviour): 

	public _scoreModifier as int = 50
	private _isAlive as bool = true
	
	_score as int

	
	def Start ():
		pass
		
	def OnEnable ():
		God.Inst.Hermes.Listen(MessageDead, self)

	def OnDisable ():
		God.Inst.Hermes.StopListening(MessageDead, self)
		
	def OnMsgDead (msg as MessageDead):
		_isAlive = false
		
	def Update ():
		
		if _isAlive:
			newScore as int = self.transform.position.x / _scoreModifier
			if newScore != _score:
				_score = newScore
				MessageScore(_score);

