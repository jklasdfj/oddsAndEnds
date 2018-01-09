import numpy

INDEL = -1 #insert/delete cost
MISMATCH = -1
MATCH = 1

def optimalGlobalAligntment(v, w):

    m = generate2dArray(len(v)+1, len(w)+1)
    m = initializeRowsDescending(m)
    m = initializeColsDescending(m)
    [rows,cols] = m.shape

    for row in range(1,rows):
        for col in range(1,cols):
            vertical = m[row-1,col] + INDEL             #calc vertical
            horizontal = m[row,col-1] + INDEL             #calc hori

            #calc diag if applicable
            diag = -9999 #this should be negative infinity but lazy modo

            if v[row-1] == w[col-1]: # character matches matching
                diag = m[row-1,col-1] + MATCH

            #take max of 3 and set it
            m[row,col] = max(vertical,horizontal,diag)

    print("S matrix below")
    print(m)
    return m

def initializeRowsDescending(m):
    out = numpy.copy(m)
    [r,c] = out.shape

    for i in range(1, r):
        out[i,0] = out[i-1,0] -1

    return out


def initializeColsDescending(m):
    out = numpy.copy(m)
    [r,c] = out.shape

    for i in range(1, c):
        out[0,i] = out[0,i-1] -1

    return out


def generate2dArray(rows,columns):
    a= numpy.zeros((rows,columns))

    return a


def generateMArray(s,v,w):
    [x,y] = s.shape
    out = numpy.zeros((x,y))

    # initialization row/col should be:
    #  all zeros because it assumes mismatch from previous which is non-existant?

    for r in range (1, x):
        for c in range (1, y):

            # Force match, no insert or delete, so -1 if mismatch
            if v[r-1] == w[c-1]: # character matches matching
                out[r,c] = s[r-1,c-1] + MATCH
            else:
                out[r,c] = s[r-1,c-1] + MISMATCH

    print("M matrix is below")
    print(out)
    return out

def problem623(v,w):

    substrings = []

    for i in range(0,(len(v)-len(w)+1)):
        substrings.append(v[i:i+len(w)])

    print(substrings)

v="tatata"
w="aaattt"

s=optimalGlobalAligntment("tatata", "aaattt")
generateMArray(s,v,w)





