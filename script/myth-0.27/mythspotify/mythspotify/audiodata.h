#ifndef AUDIODATA_H
#define AUDIODATA_H

// c
#include <stdint.h>

class AudioData {
    public:
        AudioData(int sample_rate, int channels, int num_samples, int16_t* samples);
        ~AudioData();
        int GetSampleRate();
        int GetNumChannels();
        int GetNumSamples();
        int16_t* GetSamples();
    private:
        int m_samplerate;
        int m_numsamples;
        int m_channels;
        int16_t* m_samples;
};

#endif