// control signal
wire JMP, JR, JAL;
wire RegWrite, RegDst;
wire SignedExt;
wire Beq, Bne;
wire MemToReg, MemWrite;
wire [4:0] AluOP;
wire AluSrcB;
wire Syscall;

// instruction
wire [31:0] PC;
wire [31:0] PC_4;
wire [31:0] instruction;

assign PC_4 = PC + 4;

wire [5:0] OP;
wire [5:0] Func;
wire [4:0] rs;
wire [4:0] rt;
wire [4:0] rd;
wire [25:0] index;
wire [4:0] sa;
wire [15:0] imm;

assign OP = instruction[31:26];
assign Func = instruction[5:0];
assign rs = instruction[25:21];
assign rt = instruction[20:16];
assign rd = instruction[15:11];
assign index = instruction[25:0];
assign sa = instruction[10:6];
assign imm = instruction[15:0];

// Regfile
wire [4:0] R1_in;
wire [4:0] R2_in;
wire [4:0] reg_wr_num;
wire [31:0] reg_wr_data;

assign R1_in = Syscall? 2 : rs;
assign R2_in = Syscall? 4 : rt;
assign reg_wr_num = JAL? 31 : (RegDst? rd : rt);

wire [31:0] R1_out;
wire [31:0] R2_out;

// ALU
wire [31:0] imm_extend;
wire [31:0] Alu_B;

assign Alu_B = AluSrcB? imm_extend : R2_out;

wire [4:0] shamt;

wire if_equal;
wire [31:0] ALU_output;

wire BJ;

assign BJ = (Beq & if_equal) | (Bne & ~if_equal);

// RAM
wire [19:0] RAM_addr;
wire [31:0] RAM_output;

wire [31:0] ALU_or_RAM;

assign ALU_or_RAM = MemToReg? RAM_output : ALU_output;

assign reg_wr_data = JAL? PC_4 : ALU_or_RAM;
