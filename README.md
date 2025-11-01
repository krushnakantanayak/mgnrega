# MGNREGA Dashboard - Build for Bharat Fellowship 2026

## Overview

A Flutter web application that makes MGNREGA (Mahatma Gandhi National Rural Employment Guarantee Act) district-wise performance data accessible to rural citizens in Odisha through a simple, user-friendly interface.

**Live App:** https://mgnrega-data.web.app

---

## Problem Statement

MGNREGA is one of the world's largest welfare programs serving millions of rural Indians. However, the monthly performance data published on the government API is not easily accessible to common citizens, especially those with low literacy levels. This app bridges that gap by presenting complex MGNREGA statistics in an intuitive, visual format.

---

## Features

### Current MVP Features

- **District Selection:** Simple dropdown to select from all 30 Odisha districts
- **Key Performance Metrics:** 
  - Job Cards Issued
  - Workers Employed
  - Person-Days Generated
  - Total Expenditure (₹)
- **Visual Design for Rural Users:**
  - Large, readable fonts
  - Color-coded metric cards (blue, green, orange, purple)
  - Icon-based visual indicators
  - Minimal text, maximum visual clarity

### Planned Features (Phase 2)

- Real MGNREGA API integration from data.gov.in
- Historical trend charts (6-12 months)
- District comparison analytics
- Regional language support (Odia)
- Automatic location detection (geolocation)
- Database caching for offline access
- VPS deployment with PostgreSQL backend
- Mobile-responsive optimized interface

---

## Technology Stack

### Frontend
- **Framework:** Flutter Web
- **Language:** Dart
- **UI Library:** Material Design 3
- **Chart Library:** fl_chart (for future trend visualization)

### Deployment
- **Hosting:** Firebase Hosting (MVP)
- **Database:** Local data (MVP) → PostgreSQL (Phase 2)
- **Target Migration:** DigitalOcean/AWS VPS with Nginx

### Data Source
- **MGNREGA Data:** data.gov.in API
- **Current Data:** Hardcoded (will migrate to API)

---

## Project Structure

```
mgnrega/
├── lib/
│   ├── main.dart              # Main app entry point
│   ├── models/
│   │   └── district.dart      # District data model
│   └── data/
│       └── odisha_data.dart   # Hardcoded Odisha district data
├── pubspec.yaml               # Flutter dependencies
├── firebase.json              # Firebase Hosting config
└── build/web/                 # Production build output
```

---

## Installation & Setup

### Prerequisites
- Flutter SDK (v3.0+)
- Node.js (for Firebase CLI)
- Firebase account

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/krushnakantanayak/mgnrega-data.git
   cd mgnrega
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run on web**
   ```bash
   flutter run -d chrome
   ```

### Building for Production

```bash
flutter build web --release
```

### Deploying to Firebase

```bash
firebase login
firebase init hosting
firebase deploy
```

---

## Data Structure

Each district contains:
```dart
{
  'jobCards': 125000,           // Number of job cards issued
  'workers': 95000,              // Workers currently employed
  'personDays': 2500000,         // Total person-days generated
  'expenditure': 50000000,       // Total expenditure in rupees
}
```

**Current Districts Included:** All 30 Odisha districts (Angul, Balangir, Baleswar, Bargarh, Bhadrak, Boudh, Cuttack, Deogarh, Dhenkanal, Gajapati, Ganjam, Jagatsinghpur, Jajpur, Jharsuguda, Kalahandi, Kandhamal, Kendrapara, Kendujhar, Khordha, Koraput, Malkangiri, Mayurbhanj, Nabarangpur, Nayagarh, Nuapada, Puri, Rayagada, Sambalpur, Sonepur, Sundargarh)

---

## Design Principles for Rural Users

1. **Visual Over Text:** Icons and colors communicate before text
2. **Large Touch Targets:** Buttons and interactive elements are large (48px+)
3. **Minimal Cognitive Load:** 4 key metrics, not overwhelming
4. **Accessible Colors:** High contrast for readability
5. **Fast Loading:** Optimized for slow networks (typical in rural areas)

---

## API Integration (Phase 2)

The app will fetch data from the official MGNREGA data.gov.in API:

```
GET https://data.gov.in/api/datastore_search?resource_id=[RESOURCE_ID]&district=[DISTRICT]
```

**Implementation Plan:**
- Create a backend service (Python Flask/Node.js)
- Scheduled API sync (every 6-24 hours)
- PostgreSQL database for caching
- Your own REST API endpoint for frontend consumption

---

## Performance Considerations

### Current (MVP)
- **Bundle Size:** ~5-8 MB (Flutter Web default)
- **Load Time:** < 2 seconds on 4G
- **Target Users:** Browsers with modern JavaScript support

### Production (Phase 2)
- **Database Caching:** Reduce API calls by 90%
- **CDN Deployment:** Serve static assets globally
- **Lazy Loading:** Load districts on-demand
- **Compression:** gzip + brotli for faster transmission

---

## Deployment Status

| Environment | Status | URL |
|-------------|--------|-----|
| Firebase MVP | ✅ Live | https://mgnrega-data.web.app |
| Production VPS | ⏳ Planned | TBD |
| API Backend | ⏳ Planned | TBD |

---

## Future Roadmap

### Phase 2: Data Integration (Weeks 2-3)
- Real MGNREGA API integration
- PostgreSQL database setup
- Backend API creation

### Phase 3: Production Deployment (Weeks 4-6)
- VPS setup (DigitalOcean/AWS)
- Database migration
- Nginx reverse proxy
- SSL/TLS certificates

### Phase 4: Advanced Features (Weeks 7-8)
- Multi-state support (beyond Odisha)
- Regional language translations
- Geolocation-based auto-selection
- Mobile app deployment (iOS/Android)
- Analytics dashboard

---

## Contributing

This is a Build for Bharat Fellowship project. Contributions and feedback are welcome!

---

## Author

**Krushnakanta Nayak**
- Location: Odisha, India
- Education: Final Year B.Tech Computer Science
- Contact: krushnakanta678@gmail.com

---

## License

MIT License - Feel free to use and modify for similar projects.

---

## References

- **MGNREGA Official Portal:** https://nrega.nic.in
- **Open Government Data Platform:** https://data.gov.in/catalog/mahatma-gandhi-national-rural-employment-guarantee-act-mgnrega
- **Flutter Web Deployment:** https://docs.flutter.dev/deployment/web
- **Build for Bharat Fellowship:** https://www.bharatdigital.io/fellowship

---

## Acknowledgments

- Bharat Digital for the Build for Bharat Fellowship opportunity
- Ministry of Rural Development for open MGNREGA data
- Flutter community for excellent framework and documentation

---

**Last Updated:** November 1, 2025
**Status:** MVP Complete - Ready for Submission
