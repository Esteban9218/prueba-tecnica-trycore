import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  private apiUrl = 'https://apimocha.com/task-manager-esteban';

  constructor(private http: HttpClient) {}

  // Método para crear un usuario (POST)
  createUser(userData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/create-user`, userData);
  }

  // Método para obtener todos los usuarios (GET)
  getUsers(): Observable<any> {
    return this.http.get(`${this.apiUrl}/users`);
  }
}
