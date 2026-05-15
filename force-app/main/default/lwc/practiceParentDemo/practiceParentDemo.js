import { LightningElement, wire } from 'lwc';
import getAccountlist from '@salesforce/apex/AccountController.getAccount';
export default class PracticeParentDemo extends LightningElement {
    
@wire(getAccountlist) accounts;
}
