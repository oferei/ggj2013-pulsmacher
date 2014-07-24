import UnityEngine
import System.Collections

class HeartBeat (MonoBehaviour): 
	
	public bpm as int = 60
	public riseDuration = 0.2
	public graceDuration = 0.3

	def Start ():
		InvokeRepeating("Pulsate", 60.0 / bpm, 60.0 / bpm)
		
	def OnEnable ():
		God.Inst.Hermes.Listen(MessageDead, self)

	def OnDisable ():
		God.Inst.Hermes.StopListening(MessageDead, self)
		
	def OnMsgDead (msg as MessageDead):
		CancelInvoke()
	
	def Pulsate ():
		StartCoroutine("Broadcast")
	
	def Broadcast() as IEnumerator:
		#Debug.Log("*** beat 1")
		MessageHeartBeat()
		yield WaitForSeconds(riseDuration)
		#Debug.Log("*** beat 2")
		MessageHeartBeat2()
		yield WaitForSeconds(graceDuration)
		#Debug.Log("*** beat end")
		MessageHeartBeatEnd()
