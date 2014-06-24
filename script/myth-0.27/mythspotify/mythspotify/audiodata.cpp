// mythspotify
#include "audiodata.h"

AudioData::AudioData(int sample_rate, int channels, int num_samples, int16_t* samples) {
    m_samplerate = sample_rate;
    m_channels = channels;
    m_numsamples = num_samples;
    m_samples = samples;
}

AudioData::~AudioData() {
    delete[] m_samples;
}

int AudioData::GetNumChannels() {
    return m_channels;
}

int AudioData::GetNumSamples() {
    return m_numsamples;
}

int AudioData::GetSampleRate() {
    return m_samplerate;
}

int16_t* AudioData::GetSamples() {
    return m_samples;
}