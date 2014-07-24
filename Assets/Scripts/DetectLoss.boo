import UnityEngine

class DetectLoss (MonoBehaviour): 

	dead = false

	def OnTriggerEnter(other as Collider):
		if other.gameObject.tag == 'Kill':
			if not dead:
				dead = true
				Debug.Log("Bam, you're dead.")
				MessageDead()
				gameObject.SetActive(false)