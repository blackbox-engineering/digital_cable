import consumer from '../channels/consumer';
const { v4: uuidv4 } = require('uuid');
import DigitalCable from 'digital_cable';

export class Reflex {

  constructor(reflexName) {
    this.reflexName = reflexName;
    this.reflexIdentifier = uuidv4();
    this.subscribe();
  }

  subscribe() {
    this.reflexChannel = consumer.subscriptions.create({
      channel: this.reflexName,
      identifier: this.reflexIdentifier
    }, {
      received (data) {
        if (data.digitalCable) DigitalCable.perform(data.operation);
      }
    });
  }

  disconnect() {
    this.reflexChannel.unsubscribe();
  }

  stimulate(data) {
    this.reflexChannel.perform("process_reflex", data);
  }
}
