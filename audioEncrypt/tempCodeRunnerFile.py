    
  
    #encrypt the file
    outPath = func.encrypt(filename)

    #return the encrypted file as file
    file1 = open(outPath, 'rb').read()
    file1 = base64