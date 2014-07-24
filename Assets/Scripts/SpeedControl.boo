import UnityEngine

class SpeedControl (MonoBehaviour): 

	public minSpeed as single
	public maxSpeed as single
	public acceleration as single = 3
	public direction as Vector3
	
	speed as single

	controller as CharacterController
	sprite as OTAnimatingSprite
	
	def Start ():
		controller = GetComponent[of CharacterController]()
		sprite = GetComponent[of OTAnimatingSprite]()
		speed = minSpeed
		sprite._speed = speed / maxSpeed

	def OnEnable ():
		God.Inst.Hermes.Listen(MessageDead, self)

	def OnDisable ():
		God.Inst.Hermes.StopListening(MessageDead, self)
		
	def OnMsgDead (msg as MessageDead):
		speed = 0
		
	def FixedUpdate ():
		if controller.isGrounded:
			desiredSpeed = minSpeed + (maxSpeed - minSpeed) * Mathf.Max(0, Input.GetAxis("Horizontal"));
			speed = Mathf.Lerp(speed, desiredSpeed, acceleration * Time.deltaTime)
			sprite._speed = speed / maxSpeed
			#Debug.Log("*** sprite speed: " + sprite._speed)
		#Debug.Log('speed: ' + speed)
		controller.Move(direction * speed * Time.deltaTime)
