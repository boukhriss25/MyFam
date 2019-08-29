import "bootstrap";

import { submitOnChange } from "../functions/docSubmitOnChange"
import { initButtonDisable } from "../functions/disabled_button"

submitOnChange();

import {scrollLastMessageIntoView} from "../functions/scroll";

scrollLastMessageIntoView();
initButtonDisable();
