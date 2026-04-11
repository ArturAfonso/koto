# Design Documentation — Mail Client

> Para replicação em Flutter (Dart)

---

## Fontes

| Uso | Família | Pesos |
|-----|---------|-------|
| Primária (UI inteira) | **Inter** | 300 (Light), 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold) |
| Fallback | system-ui, -apple-system, sans-serif | — |

Google Fonts: `https://fonts.google.com/specimen/Inter`

---

## Paleta de Cores — Tema Light (Claro)

| Token | HSL | HEX | Uso |
|-------|-----|-----|-----|
| background | 210 33% 98% | `#F7F9FB` | Fundo geral da aplicação |
| foreground | 215 25% 17% | `#212D3B` | Texto principal |
| card | 0 0% 100% | `#FFFFFF` | Fundo de cards e painéis |
| card-foreground | 215 25% 17% | `#212D3B` | Texto em cards |
| primary | 207 75% 52% | `#2196D6` | Cor principal / botões / acentos |
| primary-foreground | 0 0% 100% | `#FFFFFF` | Texto sobre primary |
| secondary | 210 25% 95% | `#EEF1F5` | Fundos secundários |
| secondary-foreground | 215 25% 27% | `#334155` | Texto em superfícies secundárias |
| muted | 210 20% 94% | `#ECF0F4` | Superfícies silenciadas |
| muted-foreground | 215 15% 52% | `#737F8E` | Texto muted |
| accent | 200 60% 94% | `#E0F2F9` | Destaque leve |
| accent-foreground | 207 75% 40% | `#1A78AB` | Texto sobre accent |
| destructive | 0 65% 58% | `#D45454` | Ações destrutivas |
| destructive-foreground | 0 0% 100% | `#FFFFFF` | Texto sobre destructive |
| border | 210 22% 90% | `#DFE4EA` | Bordas |
| input | 210 22% 90% | `#DFE4EA` | Borda de inputs |
| ring | 207 75% 52% | `#2196D6` | Anel de foco |
| email-sidebar | 210 25% 96% | `#F0F3F7` | Fundo da sidebar |
| email-sidebar-hover | 207 40% 92% | `#DFEBF3` | Hover da sidebar |
| email-sidebar-active | 207 55% 88% | `#CCE4F3` | Item ativo da sidebar |
| email-list-hover | 207 40% 96% | `#EFF5FA` | Hover na lista |
| email-list-selected | 207 55% 92% | `#DFEDF7` | Item selecionado na lista |
| email-unread | 215 25% 12% | `#171F28` | Texto de e-mail não lido |
| email-read | 215 15% 48% | `#6B7785` | Texto de e-mail lido |
| email-divider | 210 18% 92% | `#E5E9EE` | Divisor entre e-mails |
| email-compose-bg | 0 0% 100% | `#FFFFFF` | Fundo do modal de composição |
| email-badge | 207 75% 52% | `#2196D6` | Badge de contagem |
| email-badge-foreground | 0 0% 100% | `#FFFFFF` | Texto da badge |

---

## Paleta de Cores — Tema Dark (Escuro)

| Token | HSL | HEX | Uso |
|-------|-----|-----|-----|
| background | 220 20% 10% | `#141921` | Fundo geral |
| foreground | 210 20% 90% | `#DDE3EB` | Texto principal |
| card | 220 18% 13% | `#1A2029` | Fundo de cards |
| card-foreground | 210 20% 90% | `#DDE3EB` | Texto em cards |
| primary | 207 70% 55% | `#3AA0D8` | Cor principal |
| primary-foreground | 0 0% 100% | `#FFFFFF` | Texto sobre primary |
| secondary | 220 16% 18% | `#272D37` | Fundos secundários |
| secondary-foreground | 210 20% 82% | `#C1CCDA` | Texto secundário |
| muted | 220 14% 16% | `#232933` | Superfícies silenciadas |
| muted-foreground | 215 12% 55% | `#7E8A96` | Texto muted |
| accent | 215 25% 20% | `#263040` | Destaque leve |
| accent-foreground | 207 60% 70% | `#6DBDE6` | Texto sobre accent |
| destructive | 0 55% 45% | `#B24545` | Ações destrutivas |
| destructive-foreground | 0 0% 100% | `#FFFFFF` | Texto sobre destructive |
| border | 220 14% 20% | `#2C3340` | Bordas |
| input | 220 14% 20% | `#2C3340` | Borda de inputs |
| ring | 207 70% 55% | `#3AA0D8` | Anel de foco |
| email-sidebar | 220 18% 11% | `#171D26` | Fundo da sidebar |
| email-sidebar-hover | 220 16% 16% | `#232933` | Hover da sidebar |
| email-sidebar-active | 215 25% 20% | `#263040` | Item ativo |
| email-list-hover | 220 16% 15% | `#212730` | Hover na lista |
| email-list-selected | 215 25% 18% | `#222C3A` | Item selecionado |
| email-unread | 210 20% 92% | `#E3E9F0` | Texto não lido |
| email-read | 215 12% 55% | `#7E8A96` | Texto lido |
| email-divider | 220 14% 18% | `#282E38` | Divisor |
| email-compose-bg | 220 18% 13% | `#1A2029` | Fundo composição |
| email-badge | 207 70% 55% | `#3AA0D8` | Badge |
| email-badge-foreground | 0 0% 100% | `#FFFFFF` | Texto badge |

---

## Dimensões e Espaçamento

| Elemento | Valor |
|----------|-------|
| Border Radius (padrão) | 8px (0.5rem) |
| Border Radius (md) | 6px |
| Border Radius (sm) | 4px |
| Sidebar largura | 224px (14rem) |
| Lista de e-mails largura | 320px (20rem) |
| Padding padrão | 16px (1rem) |
| Gap entre itens | 4–12px |

---

## Ícones

Biblioteca: **Lucide Icons** (equivalente em Flutter: `lucide_icons` ou SVGs customizados)

Ícones usados:
- `Inbox`, `Send`, `FileText`, `Trash2`, `AlertOctagon`
- `Settings`, `UserPlus`, `PenSquare`
- `Search`, `X`, `Mail`, `MailOpen`
- `Reply`, `ReplyAll`, `Forward`
- `Moon`, `Sun`
