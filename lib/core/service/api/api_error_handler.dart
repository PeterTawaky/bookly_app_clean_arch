import 'package:bookly_app/core/service/api/api_error_factory.dart';
import 'package:bookly_app/core/service/api/api_error_model.dart';
import 'package:bookly_app/core/service/api/local_status_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic e) {
    switch (e) {
      case DioException(:final DioExceptionType type):
        return switch (type) {
          DioExceptionType.connectionError => ApiErrorModel(
            message:
                "No internet connection. Please check your WiFi or mobile data.",
            icon: Icons.wifi_off,
            statusCode: LocalStatusCodes.connectionError,
          ),
          DioExceptionType.connectionTimeout => ApiErrorModel(
            message: "Connection timed out. Please try again.",
            icon: Icons.timer_off,
            statusCode: LocalStatusCodes.connectionTimeout,
          ),
          DioExceptionType.sendTimeout => ApiErrorModel(
            message: "Couldn't send your request. Please try again.",
            icon: Icons.send,
            statusCode: LocalStatusCodes.sendTimeout,
          ),
          DioExceptionType.receiveTimeout => ApiErrorModel(
            message: "Taking too long to load. Please try again later.",
            icon: Icons.downloading,
            statusCode: LocalStatusCodes.receiveTimeout,
          ),
          DioExceptionType.badCertificate => ApiErrorModel(
            message: "Security issue detected. Please try again later.",
            icon: Icons.security,
            statusCode: LocalStatusCodes.badCertificate,
          ),
          DioExceptionType.badResponse when e.response?.statusCode != null =>
            switch (e.response!.statusCode) {
              400 => ApiErrorModel(
                message: "Something went wrong. Please try again.",
                icon: Icons.error_outline,
                statusCode: 400,
              ),
              401 => ApiErrorModel(
                message: "Please log in to continue.",
                icon: Icons.lock_outline,
                statusCode: 401,
              ),
              403 => ApiErrorModel(
                message: "You don't have permission to access this.",
                icon: Icons.block,
                statusCode: 403,
              ),
              404 => ApiErrorModel(
                message: "We couldn't find what you're looking for.",
                icon: Icons.search_off,
                statusCode: 404,
              ),
              422 => ApiErrorModel(
                message: "Please check your information and try again.",
                icon: Icons.warning_amber,
                statusCode: 422,
              ),
              429 => ApiErrorModel(
                message: "Please wait a moment before trying again.",
                icon: Icons.timelapse,
                statusCode: 429,
              ),
              500 => ApiErrorModel(
                message: "We're having some trouble. Please try again later.",
                icon: Icons.dangerous,
                statusCode: 500,
              ),
              502 => ApiErrorModel(
                message:
                    "We're experiencing technical issues. Please try again soon.",
                icon: Icons.cloud_off,
                statusCode: 502,
              ),
              503 => ApiErrorModel(
                message:
                    "Our service is currently unavailable. Please check back later.",
                icon: Icons.engineering,
                statusCode: 503,
              ),
              504 => ApiErrorModel(
                message: "Request timed out. Please try again.",
                icon: Icons.timer_off,
                statusCode: 504,
              ),
              _ => ApiErrorFactory.badResponseWithoutCode,
            },
          DioExceptionType.badResponse => ApiErrorModel(
            message: "Something went wrong. Please try again.",
            icon: Icons.warning,
            statusCode: LocalStatusCodes.badResponse,
          ),
          DioExceptionType.cancel => ApiErrorModel(
            message: "Request was cancelled. Please try again.",
            icon: Icons.cancel,
            statusCode: LocalStatusCodes.cancel,
          ),
          DioExceptionType.unknown => ApiErrorModel(
            message: "Something went wrong. Please try again later.",
            icon: Icons.error_outline,
            statusCode: LocalStatusCodes.unknown,
          ),
        };
      case Exception _:
        return ApiErrorFactory.defaultError;
      default:
        return ApiErrorFactory.defaultError;
    }
  }
}
