import UnityEngine

class LoadGameScene (MonoBehaviour): 

	def Update ():
		if Input.GetButtonDown("Jump"):
			Application.LoadLevel(1)
