import { create } from 'zustand'

export enum AuthStatus {
    authenticated = "authenticated",
    unauthenticated = "unauthenticated"
}

interface AuthState {
    authStatus: AuthStatus
    login: () => void
    logout: () => void
}

export const useAuthStore = create<AuthState>()((set) => ({
    authStatus: AuthStatus.unauthenticated,
    // TODO: actually add auth
    login: () => set((state) => ({authStatus: AuthStatus.authenticated})),
    logout: () => set((state) => ({authStatus: AuthStatus.unauthenticated}))
}))