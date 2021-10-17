# Bird Verifier

Verify bird calls

## License

This project is licensed under the Affero General Public License
(https://www.gnu.org/licenses/agpl-3.0.en.html).

## Getting Started

Our current audio machine learning model analyses each audio recording that is uploaded from the Bird Monitors. The model predicts the presence or otherwise of specific bird species (currently just Morepork/Ruru) in a sliding 3 second window across each minute recording.

The Bird Verifier app allows users to:

1) Listen to just those 3 second windows,
2) Press a button to indicate if they agree or otherwise with the model,
3) Immediately uploads this feedback to The Cacophony server - as a tag against the recording: this will provide valuable data for further improvements to the model.


