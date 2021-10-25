import json

BASE_URI = 'ipfs://QmS8YrUPB14q8MBhK8oYmwXQ2DUA9sheRDca52oWrsdGcB/'
DESCRIPTION = "Regal Raptors are a collection of Ethereum NFTs created by multiple artists with 100% of proceeds going to raptor conservation (hawk, falcon, eagle, and owl). Each image is a Founding Member token redeemable for in-person raptor experiences coming 2022-2024."

birds = {
	'Hawk' : ['Kieselhorst', 'Meinardus', 'Nhefertiti', 'Quick'],
	'Falcon' : ['Meinardus', 'Nhefertiti'],
	'Eagle' : ['Kieselhorst', 'Meinardus', 'Nhefertiti'],
	'Owl' : ['Kieselhorst', 'Meinardus', 'Nhefertiti'],
	'Vulture' : ['Meinardus', 'Nhefertiti']
}

bird_mapping = {
	'Hawk' : 1,
	'Falcon' : 2,
	'Eagle' : 3,
	'Owl' : 4,
	'Vulture' : 5
}

tokenId = 0
for bird, artists in birds.items():
	count = 0
	for artist in artists:
		for i in range(5):
			data = {
			  "name": f'{bird}s: {str(bird_mapping[bird]) + "{0:02d}".format(count)}',
			  "description": DESCRIPTION,
			  "image": BASE_URI + bird + artist + '.jpg' 
			}
			
			with open(f'RegalRaptors/jsons/{tokenId}.json', 'w') as file:
				json.dump(data, file)

			count += 1
			tokenId += 1

