export interface AuthResponseData {
  kind: string;
  idToken: string;
  username: string;
  refreshToken: string;
  localId: string;
  expiresIn: Date;
  registered?: boolean;
}
