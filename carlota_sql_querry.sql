SELECT
	* 
FROM
	(
	SELECT
		
		a.`Código` AS pes_id_antigo,
		2 AS pes_id_firma,
		1 AS pes_cliente,
		UCASE( a.`Nome / Razão Social` ) AS pes_razaosocial,
		UCASE(COALESCE ( a.`Nome Fantasia / Apelido`, a.`Nome / Razão Social` )) AS pes_fantasia,
		COALESCE ( a.Cidade, 'VIAMÃO' ) AS pes_reside_cidade,
		COALESCE ( a.UF, 'RS' ) AS pes_reside_uf,
		- 1 AS pes_cod_ibge,
		a.`Endereço` AS pes_reside_endereco,
		a.Bairro AS pes_reside_bairro,
		a.Complemento AS pes_reside_complemento,
		a.`Número` AS pes_reside_numero,
		a.CEP AS pes_reside_cep,
		a.Email AS pes_email,
		a.`I.E. / RG` AS pes_inscricao_rg,
		a.`CNPJ / CPF` AS pes_cnpj_cpf,
		a.`Referência` AS pes_observacoes,
		'' AS pes_inscricao_municipal,
		a.Telefone AS pes_reside_fone1,
		a.Telefone AS pes_reside_fone2,
		a.Telefone AS pes_reside_celular,
		REPLACE(a.`Limite de Crédito`, ',' , '.') AS pes_limite_credito,
		CONCAT(
			RIGHT ( a.`Dt.Cadastro`, 4 ),
			'-',
			MID( a.`Dt.Cadastro`, 4, 2 ),
			'-',
			LEFT ( a.`Dt.Cadastro`, 2 ) 
		) AS pes_data_cadastro 
	FROM
		clientesnew a 
	WHERE
		LENGTH(
		COALESCE ( a.`Nome Fantasia / Apelido`, a.`Nome / Razão Social` )) > 0 
	) AS tmp