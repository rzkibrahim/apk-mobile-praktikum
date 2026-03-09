import 'package:flutter/material.dart';
import 'package:modul_2/core/constants/app_constants.dart';
import 'package:modul_2/core/theme/app_theme.dart';
import 'package:modul_2/features/profile/data/models/profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileModel profile;

  const ProfileHeader({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppConstants.gradientPurple,
        ), // LinearGradient
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ), // BorderRadius.only
        boxShadow: [
          BoxShadow(
            color: AppConstants.gradientPurple[0].withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ), // BoxShadow
        ],
      ), // BoxDecoration
      child: Column(
        children: [
          // Avatar
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white.withOpacity(0.3),
            child: Text(
              profile.nama.substring(0, 1).toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ), // CircleAvatar
          const SizedBox(height: 16),
          Text(
            profile.nama,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ), // Text
          const SizedBox(height: 4),
          Text(
            profile.nim,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 14,
            ),
          ), // Text
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              profile.jurusan,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ), // Container
        ],
      ), // Column
    ); // Container
  }
}

class ProfileInfoCard extends StatelessWidget {
  final ProfileModel profile;

  const ProfileInfoCard({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ), // BoxShadow
        ],
      ), // BoxDecoration
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informasi Pribadi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.3,
              ),
            ), // Text
            const SizedBox(height: 16),
            _buildInfoRow(Icons.school_outlined, 'Jurusan', profile.jurusan),
            _buildDivider(),
            _buildInfoRow(
              Icons.calendar_today_outlined,
              'Angkatan',
              profile.angkatan,
            ),
            _buildDivider(),
            _buildInfoRow(Icons.email_outlined, 'Email', profile.email),
            _buildDivider(),
            _buildInfoRow(Icons.phone_outlined, 'No. HP', profile.noHp),
            _buildDivider(),
            _buildInfoRow(
              Icons.location_on_outlined,
              'Alamat',
              profile.alamat,
            ),
          ],
        ), // Column
      ), // Padding
    ); // Container
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.primaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ), // Expanded
        ],
      ), // Row
    ); // Padding
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: Colors.grey.withOpacity(0.15),
    );
  }
}