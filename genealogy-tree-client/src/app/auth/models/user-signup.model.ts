import { UserLoginModel } from './user-login.model';

export class UserSignupModel extends UserLoginModel{
  firstName: string;
  lastName: string;
  gender: string;
  nationality: string;
  birthdate: Date;
  email: string;
}
