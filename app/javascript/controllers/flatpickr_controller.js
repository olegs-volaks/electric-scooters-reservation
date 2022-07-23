import {Controller} from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import {Latvian} from "flatpickr/dist/l10n/lv";

// Connects to data-controller="flatpickr"
export default class extends Controller {

    static values = {
        enableTime: {type: Boolean, default: true}
    }

    connect() {
        this.flatpickr = flatpickr(this.element, {
            locale: Latvian,
            enableTime: this.enableTimeValue
        })
        this.flatpickr.localize(flatpickr.l10ns.ru)
    }
}
