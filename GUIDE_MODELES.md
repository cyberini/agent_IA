# 🧠 Changer le « cerveau » de tes agents

Tous les agents de l'atelier lisent le modèle à utiliser dans **une seule ligne** du fichier `.env` :

```
MODELE_IA=gemini-flash-latest
```

Vous pouvez changer cette ligne, relancer `adk web agents`, et **tous** vos agents changeront de cerveau, sans toucher au code. C'est le rôle de `agents/commun.py`.

---

## Option 1 - Gemini (par défaut, gratuit)

Clé sur https://aistudio.google.com/apikey à mettre dans la variable `GOOGLE_API_KEY`.

| Valeur de `MODELE_IA` | Quand l'utiliser |
|---|---|
| `gemini-flash-latest` | Par défaut. Pointe toujours vers le Flash le plus récent. |
| `gemini-flash-lite-latest` | Si des erreurs **429** (quota) surviennent : plus rapide, quotas gratuits plus larges. |
| `gemini-2.5-flash` (ou un autre numéro précis) | Si vous souhaitez un comportement **figé**, qui ne change pas quand Google sort un nouveau modèle. |

**Limites du gratuit :** quelques requêtes par minute et un plafond par jour. Les quotas sont **par clé/projet** : chacun doit avoir **sa propre clé**. Les données envoyées peuvent être utilisées par Google pour améliorer ses modèles puis **données fictives et/ou non sensibles uniquement**.

## Option 2 - OpenRouter (plan B gratuit, sans Google)

1. Compte sur https://openrouter.ai puis **Keys** puis créer une clé.
2. Sur https://openrouter.ai/models, filtrer par prix **Free** et choisir un modèle qui gère les **tools**. Son nom se termine par `:free`.
3. Dans `.env` :

```
MODELE_IA=openrouter/NOM-DU-MODELE:free
OPENROUTER_API_KEY=ta_cle
```

> La liste des modèles gratuits change souvent : vérifier le nom sur le site le jour J.

## Option 3 - Ollama (100 % local, confidentiel, sans clé)

Uniquement **sur votre propre ordinateur** (pas dans Codespaces : trop lent sans carte graphique). Il faut une machine correcte (16 Go de RAM conseillés).

1. Installez Ollama : https://ollama.com
2. Téléchargez un modèle qui gère les outils : `ollama pull qwen2.5:7b`
3. Dans `.env` mettre:

```
MODELE_IA=ollama_chat/qwen2.5:7b
# Si vous travaillez dans le conteneur Docker (Dev Container) :
OLLAMA_API_BASE=http://host.docker.internal:11434
# Si vous travaillez sans Docker (Python installé directement) :
# OLLAMA_API_BASE=http://localhost:11434
```

> ⚠️ Utilisez bien le préfixe `ollama_chat/` (et pas `ollama/`), sinon les outils fonctionnent mal.
>
> 💡 C'est **la seule option où vos données ne quittent pas votre machine**. Idéal pour discuter avec confidentialité.
