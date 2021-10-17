# Bird Verifier

Verify bird calls and songs

## License

This project is licensed under the Affero General Public License
(https://www.gnu.org/licenses/agpl-3.0.en.html).

## Getting Started

Our current audio machine learning model analyses each audio recording that is uploaded from the Bird Monitors. The model assesses the presence or otherwose of specific bird species (currently just Morepork/Ruru) in a sliding 3 second window across each recording.

This app (the Bird Verifier) allows users to listen to just those 3 second windows, and give feedback to The Cacophony server on whether they agree with the model's predictions. This will provide valuable data for further improvements to the model.
