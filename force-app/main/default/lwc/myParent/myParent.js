import { LightningElement, wire } from 'lwc';
import getJobApplicationList from '@salesforce/apex/JobApplicationController.getJobApplicationList';

export default class MyParent extends LightningElement {

  @wire(getJobApplicationList ) jobApplicationList;
}


