import UnityEngine

class CamFollowMinSpeed (MonoBehaviour): 
	
	public target as Transform
	public initialSpeed as single = 300
	public maxSpeed as single = 450
	public accelerationByScore as single = 0.15
	public direction as Vector3
	
	curSpeed as single

	def Start ():
		curSpeed = initialSpeed
	
	def OnEnable ():
		God.Inst.Hermes.Listen(MessageDead, self)
		God.Inst.Hermes.Listen(MessageScore, self)

	def OnDisable ():
		God.Inst.Hermes.StopListening(MessageDead, self)
		God.Inst.Hermes.StopListening(MessageScore, self)
		
	def OnMsgDead (msg as MessageDead):
		curSpeed /= 2
	
	def OnMsgScore (msg as MessageScore):
		#Debug.Log("*** score: " + msg.Score)
		curSpeed = initialSpeed + msg.Score * accelerationByScore
		if curSpeed > maxSpeed:
			curSpeed = maxSpeed
		#Debug.Log("*** speed: " + curSpeed)
	
	def FixedUpdate ():
		self.transform.position += direction * curSpeed * Time.deltaTime
		ahead = (target.position - self.transform.position).x;
		if ahead > 0:
			self.transform.position.x += ahead
