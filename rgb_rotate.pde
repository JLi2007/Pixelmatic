class RGBRotate{
    float[][] valueMatrix;

    RGBRotate() {
        valueMatrix = new float[3][3];
        valueMatrix[0][0] = 1; valueMatrix[0][1] = 0; valueMatrix[0][2] = 0;
        valueMatrix[1][0] = 0; valueMatrix[1][1] = 1; valueMatrix[1][2] = 0;
        valueMatrix[2][0] = 0; valueMatrix[2][1] = 0; valueMatrix[2][2] = 1;
    }

    void setHueRotation(float degrees) {
        float cosA = cos(radians(degrees));
        float sinA = sin(radians(degrees));
        float sqrt = sqrt(1.0 / 3.0);

        valueMatrix[0][0] = cosA + (1.0 - cosA) / 3.0;
        valueMatrix[0][1] = 1.0 / 3.0 * (1.0 - cosA) - sqrt * sinA;
        valueMatrix[0][2] = 1.0 / 3.0 * (1.0 - cosA) + sqrt * sinA;

        valueMatrix[1][0] = 1.0 / 3.0 * (1.0 - cosA) + sqrt * sinA;
        valueMatrix[1][1] = cosA + 1.0 / 3.0 * (1.0 - cosA);
        valueMatrix[1][2] = 1.0 / 3.0 * (1.0 - cosA) - sqrt * sinA;

        valueMatrix[2][0] = 1.0 / 3.0 * (1.0 - cosA) - sqrt * sinA;
        valueMatrix[2][1] = 1.0 / 3.0 * (1.0 - cosA) + sqrt * sinA;
        valueMatrix[2][2] = cosA + 1.0 / 3.0 * (1.0 - cosA);
    }

    void setSaturationRotation(float scale){
        float luminanceR = 0.2126f; 
        float luminanceG = 0.7152f; 
        float luminanceB = 0.0722f;
        
        valueMatrix[0][0] = luminanceR + (1.0 - luminanceR) * scale;
        valueMatrix[0][1] = luminanceG * (1.0 - scale);
        valueMatrix[0][2] = luminanceB * (1.0 - scale);

        valueMatrix[1][0] = luminanceR * (1.0 - scale);
        valueMatrix[1][1] = luminanceG + (1.0 - luminanceG) * scale;
        valueMatrix[1][2] = luminanceB * (1.0 - scale);

        valueMatrix[2][0] = luminanceR * (1.0 - scale);
        valueMatrix[2][1] = luminanceG * (1.0 - scale);
        valueMatrix[2][2] = luminanceB + (1.0 - luminanceB) * scale;
    }

    int[] applyFilter(float r, float g, float b){
        float r_value = r*valueMatrix[0][0] + g*valueMatrix[0][1] + b*valueMatrix[0][2];
        float g_value = r*valueMatrix[1][0] + g*valueMatrix[1][1] + b*valueMatrix[1][2];
        float b_value = r*valueMatrix[2][0] + g*valueMatrix[2][1] + b*valueMatrix[2][2];
        return new int [] {bounds(r_value), bounds(g_value), bounds(b_value)};
    }

    int bounds(float value){
        if (value < 0){
            return 0;
        }
        if (value > 255){
            return 255;
        }
        return int(value + 0.5);
    }
}

    
