var Pessoa = /** @class */ (function () {
    function Pessoa(nome, cpf, dataNascimento) {
        this.nome = nome;
        this.cpf = cpf;
        this.dataNascimento = dataNascimento;
        if (nome.length < 3) {
            throw new Error('NOME INVÁLIDO');
        }
        if (cpf.length !== 11) {
            throw new Error('CPF INVÁLIDO');
        }
    }
    Pessoa.prototype.getCPF = function () {
        var mascaraCPF = "".concat(this.cpf.substring(0, 3), ".").concat(this.cpf.substring(3, 6), ".").concat(this.cpf.substring(6, 9), "-").concat(this.cpf.substring(9));
        return mascaraCPF;
    };
    Pessoa.prototype.getIdade = function () {
        var dataAtual = new Date();
        var age = dataAtual.getFullYear() - this.dataNascimento.getFullYear();
        var m = dataAtual.getMonth() - this.dataNascimento.getMonth();
        if (m < 0 || (m === 0 && dataAtual.getDate() < this.dataNascimento.getDate())) {
            age--;
        }
        return age.toString();
    };
    return Pessoa;
}());
var pessoa1 = new Pessoa('Vitor', '12345678910', new Date('2003-12-05'));
console.log(pessoa1.getCPF());
console.log(pessoa1.getIdade());
