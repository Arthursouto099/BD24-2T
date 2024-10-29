class Pessoa
{
    constructor(public nome: string, public cpf: string, public dataNascimento: Date) {
        if(nome.length < 3) {
            throw new Error('NOME INVÁLIDO');
        }
        if(cpf.length !== 11) {
            throw new Error('CPF INVÁLIDO');
        }
    }

    getCPF(): string {
        let mascaraCPF: string = `${this.cpf.substring(0,3)}.${this.cpf.substring(3,6)}.${this.cpf.substring(6,9)}-${this.cpf.substring(9)}`
        return mascaraCPF;
    }

    getIdade(): string {
        let dataAtual: Date = new Date()
        let age = dataAtual.getFullYear() - this.dataNascimento.getFullYear();
        let m = dataAtual.getMonth() - this.dataNascimento.getMonth()
        if (m < 0 || (m === 0 && dataAtual.getDate() < this.dataNascimento.getDate())) {
            age--;
        }
        return age.toString();
    }
}

let pessoa1: Pessoa = new Pessoa('Vitor', '12345678910', new Date('2003-12-05'));
console.log(pessoa1.getCPF())
console.log(pessoa1.getIdade());