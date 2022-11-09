1) In the README.txt please explain what you think the “secret formula” file is doing (in one
paragraph, 3+ lines). (5 points)

The secret formula file takes in an array of numbers and uses its functions to encrypt and then 
decrypt each number in the array. It has two outputs, one array of encrypted numbers and 
another array of decrypted numbers. The second array should be the same as the original array. 
The encryption is done by using exponents and remainders which is then reversedin a similar 
method in the decryption.

2) Given arrays u = [0x03, 0x05 0x01] and t = [0x07, 0x03, 0x15] and given x, y are the same
values as the above sample code. What happens if:

    (i) c[i]=secret_formula_apply(u[i]), f[i]=secret_formula_apply(t[i]), then does 
    u[i]*t[i] = secret_formula_remove(c[i]*f[i]) hold for all entries in both arrays? 
    (2.5 points)
    
    Yes, u[i]*t[i] = secret_formula_remove(c[i]*f[i]) hold for all entries in both arrays.

    (ii) c[i]=secret_formula_apply(u[i]), f[i]=secret_formula_apply(t[i]), then does 
    u[i]+t[i] = secret_formula_remove(c[i]+f[i]) hold for all entries in both arrays? 
    (2.5 points)

    No, u[i]+t[i] = secret_formula_remove(c[i]+f[i]) does not hold for all entries in both 
    arrays.
