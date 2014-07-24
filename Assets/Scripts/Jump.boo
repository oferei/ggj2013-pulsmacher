import UnityEngine

class Jump (MonoBehaviour): 

	public speed as single = 3
	public riseFactor as single = 2
	public shakeSpeed as single = 2
	public gravity as single = 9.8
	public jumpSound as AudioSource
	public jumpSoundFactor as single = 0.7
	public impactSound as AudioSource

	origVolume as single
	curSpeed as single = 0
	controller as CharacterController
	isGrounded = true
	isRising = false

	def Start ():
		origVolume = jumpSound.volume
		controller = GetComponent[of CharacterController]()
		
	def OnEnable ():
		God.Inst.Hermes.Listen(MessageHeartBeat, self)
		God.Inst.Hermes.Listen(MessageHeartBeat2, self)
		God.Inst.Hermes.Listen(MessageHeartBeatEnd, self)

	def OnDisable ():
		God.Inst.Hermes.StopListening(MessageHeartBeat, self)
		God.Inst.Hermes.StopListening(MessageHeartBeat2, self)
		God.Inst.Hermes.StopListening(MessageHeartBeatEnd, self)
		
	def OnMsgHeartBeat (msg as MessageHeartBeat):
		isRising = true
	
	def OnMsgHeartBeat2 (msg as MessageHeartBeat2):
		pass
		
	def OnMsgHeartBeatEnd (msg as MessageHeartBeatEnd):
		isRising = false
		if isGrounded:
			curSpeed = shakeSpeed
	
	def Update ():
		curSpeed -= gravity * Time.deltaTime
		controller.Move(Vector3.up * curSpeed * Time.deltaTime)
		
		if controller.isGrounded:
			curSpeed = 0
		
		if not isGrounded and controller.isGrounded:
			impactSound.Play()
		
		isGrounded = controller.isGrounded
		if Input.GetButton("Jump") and controller.isGrounded:
			if isRising:
				volumeFactor = 1.0
				curSpeed = speed * riseFactor
			else:
				volumeFactor = jumpSoundFactor
				curSpeed = speed
			jumpSound.volume = origVolume * volumeFactor
			jumpSound.Play()
			isGrounded = false
