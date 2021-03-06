###
# Download and install enabled model files
##
if( VIAME_DOWNLOAD_MODELS )

  # GUI Background Context View
  if( VIAME_ENABLE_VIVIA )
    DownloadAndExtract(
      https://data.kitware.com/api/v1/item/5afe6c018d777f15ebe1d6f2/download
      7e8800cb11a1a491140e7f58e9053030
      ${VIAME_DOWNLOAD_DIR}/models-blue_marble_context-v1.0.0.tar.gz
      ${CMAKE_CURRENT_SOURCE_DIR}/gui-params )
  endif()

  # PyTorch Detection, Tracking And Rapid Model Generation Models
  if( VIAME_ENABLE_PYTORCH AND VIAME_DOWNLOAD_MODELS-PYTORCH )

    # Default default and generic detection models
    if( VIAME_ENABLE_PYTORCH-NETHARN )
      DownloadAndExtract(
        https://data.kitware.com/api/v1/item/5f6589e750a41e3d19994297/download
        a8232101e4a8b4d4b54ac56c56d3cde7
        ${VIAME_DOWNLOAD_DIR}/models-netharn_detection-v1.0.3.zip
        ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )
    elseif( VIAME_ENABLE_PYTORCH-MMDET )
      DownloadAndExtract(
        https://data.kitware.com/api/v1/item/5cdda0b78d777f072bb09919/download
        63848830dd40b9b1ae9e3a589d4dc8f4
        ${VIAME_DOWNLOAD_DIR}/models-mmdet_detection-v1.1.0.tar.gz
        ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )
    endif()

    # Default annotation assist tracking models
    if( VIAME_ENABLE_PYTORCH-PYSOT )
      DownloadAndExtract(
        https://data.kitware.com/api/v1/item/5d2f87ac877dfcc90212d12c/download
        0bc80c5f339620255fb977e22a159bc7
        ${VIAME_DOWNLOAD_DIR}/models-pysot_tracking_models-v1.0.0.tar.gz
        ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )
    endif()

    if( VIAME_ENABLE_PYTORCH-MDNET )
      DownloadAndExtract(
        https://data.kitware.com/api/v1/item/5e12b04aaf2e2eed35d42979/download
        8f6a709478bbd69e4d97fc34ac9b6003
        ${VIAME_DOWNLOAD_DIR}/models-mdnet_tracking_models-v1.0.0.tar.gz
        ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )
    endif()

    DownloadAndExtract(
      https://data.kitware.com/api/v1/item/5b6890a38d777f06857c1f22/download
      51b979d61df667b4751000192426f106
      ${VIAME_DOWNLOAD_DIR}/models-pytorch_tracking-v1.1.0.tar.gz
      ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )

    DownloadAndExtract(
      https://data.kitware.com/api/v1/item/5bad56178d777f06b908c47c/download
      3fe6c43e8bf6ab49cb8f6687f38bdbd6
      ${VIAME_DOWNLOAD_DIR}/models-pytorch_descriptors-v1.1.0.tar.gz
      ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )

    if( VIAME_DOWNLOAD_MODELS-SEA-LION )
      DownloadAndInstallAddOn(
        https://data.kitware.com/api/v1/item/5f750f1c50a41e3d19bc97bb/download
        3ed807df7513521afd1cc6a5efb951e6
        ${VIAME_DOWNLOAD_DIR}/VIAME-Sea-Lion-Models-v1.1.zip )
    endif()
  else()
    if( VIAME_DOWNLOAD_MODELS-SEA-LION )
      message( FATAL_ERROR "Sea Lion models require pytorch" )
    endif()
  endif()

  # Caffe Model Files
  if( VIAME_ENABLE_CAFFE )
    DownloadAndExtract(
      https://data.kitware.com/api/v1/item/5afe6e1e8d777f15ebe1d6fc/download
      2cdbe7ca51b49b12e59911aadec20e98
      ${VIAME_DOWNLOAD_DIR}/models-default_caffe_descriptor-v1.0.0.tar.gz
      ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )
  endif()

  # YOLO Model Files
  if( VIAME_ENABLE_YOLO )
    DownloadAndExtract(
      https://data.kitware.com/api/v1/item/5f6589e850a41e3d199942a2/download
      8d5e963d14ce5f717f149277710c2dc6
      ${VIAME_DOWNLOAD_DIR}/models-yolo_v2_seed_model-v1.3.0.zip
      ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )

    DownloadAndExtract(
      https://data.kitware.com/api/v1/item/5f6589eb50a41e3d199942ae/download
      a30f0a5fbc8dc729b3ee2fe38f888357
      ${VIAME_DOWNLOAD_DIR}/models-yolo_v3_seed_model-v1.3.0.zip
      ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )

    if( VIAME_DOWNLOAD_MODELS-MOUSS )
      DownloadAndExtract(
        https://data.kitware.com/api/v1/item/5bad56158d777f06b908c473/download
        00aa39ecdc321b205ed54766441c65aa
        ${VIAME_DOWNLOAD_DIR}/models-mouss-v2.1.0.tar.gz
        ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )
    endif()

    if( VIAME_DOWNLOAD_MODELS-ARCTIC-SEAL )
      DownloadAndExtract(
        https://data.kitware.com/api/v1/item/5cbb84d08d777f072b53ab46/download
        5d92853d93e758260dfefbf12ab70ab5
        ${VIAME_DOWNLOAD_DIR}/models-arctic_seal_yolo-v1.3.tar.gz
        ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )
    endif()
  endif()

  # Tensorflow Models
  if( VIAME_ENABLE_TENSORFLOW )
    if( VIAME_DOWNLOAD_MODELS-ARCTIC-SEAL )
      DownloadAndExtract(
        https://data.kitware.com/api/v1/item/5cb74eeb8d777f072b40f904/download
        5af19ef3d8c29d3726674421912a44dc
        ${VIAME_DOWNLOAD_DIR}/models-arctic_seal_tf-v1.1.1.tar.gz
        ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )
    endif()
  endif()

  # Mixed Models
  if( VIAME_DOWNLOAD_MODELS-HABCAM )
    if( WIN32 )
      DownloadAndInstallAddOn(
        https://data.kitware.com/api/v1/item/5f6bb7e850a41e3d19a63047/download
        57f9818870f8c43036e4b4ce082cd96d
        ${VIAME_DOWNLOAD_DIR}/VIAME-HabCam-Models-v1.5-Win.zip )
    else()
      DownloadAndInstallAddOn(
        https://data.kitware.com/api/v1/item/5f6bb80950a41e3d19a630e9/download
        67f1e38350faba785b51cf207aa4dc18
        ${VIAME_DOWNLOAD_DIR}/VIAME-HabCam-Models-v1.5-Linux.zip )
    endif()
  endif()

  # Transformation Models
  if( VIAME_DOWNLOAD_MODELS-ARCTIC-SEAL )
    DownloadAndExtract(
      https://data.kitware.com/api/v1/item/5d6edf99d35580e6dcddbc3b/download
      1a122a8a5ab5e59ca8a149954da8a252
      ${VIAME_DOWNLOAD_DIR}/models-arctic_seal_transforms-v0.2.tar.gz
      ${CMAKE_CURRENT_SOURCE_DIR}/pipelines )
  endif()
endif()

###
# All subdirectories for this folder installed as-is
##
install( DIRECTORY gui-params
         DESTINATION configs )
install( DIRECTORY prj-linux
         DESTINATION configs )
install( DIRECTORY prj-windows
         DESTINATION configs )

###
# All config files manually-included by default or based on options
##
set( CORE_PIPELINE_FILES
  pipelines/classify_detections_svm.pipe
  pipelines/common_default_descriptor.pipe
  pipelines/common_default_detector.pipe
  pipelines/common_default_detector_with_filter.pipe
  pipelines/common_default_initializer.pipe
  pipelines/common_default_input.pipe
  pipelines/common_default_input_with_downsampler.pipe
  pipelines/common_default_tracker.pipe
  pipelines/common_generic_detector.pipe
  pipelines/common_generic_detector_with_filter.pipe
  pipelines/common_image_stabilizer.pipe
  pipelines/common_stabilized_iou_tracker.pipe
  pipelines/database_apply_svm_models.pipe
  pipelines/detector_default.pipe
  pipelines/detector_extract_chips.pipe
  pipelines/detector_generic.pipe
  pipelines/detector_local.pipe
  pipelines/detector_local_left.pipe
  pipelines/detector_simple_hough.pipe
  pipelines/detector_svm_models.pipe
  pipelines/display_annotations.pipe
  pipelines/draw_detections_on_images.pipe
  pipelines/extract_chips_from_detections.pipe
  pipelines/filter_debayer_and_enhance.pipe
  pipelines/filter_enhance.pipe
  pipelines/filter_extract_left.pipe
  pipelines/filter_split_and_debayer.pipe
  pipelines/filter_to_kwa.pipe
  pipelines/full_frame_classifier_local.pipe
  pipelines/full_frame_classifier_svm.pipe
  pipelines/generate_empty_frame_lbls_1fr.pipe
  pipelines/generate_empty_frame_lbls_10fr.pipe
  pipelines/generate_empty_frame_lbls_100fr.pipe
  pipelines/generate_empty_frame_lbls_1000fr.pipe
  pipelines/generate_reset_detections.pipe
  pipelines/index_default.pipe
  pipelines/index_default.svm.pipe
  pipelines/index_default.trk.pipe
  pipelines/index_existing.pipe
  pipelines/index_full_frame.pipe
  pipelines/index_full_frame.svm.pipe
  pipelines/index_full_frame.svm.annot_only.pipe
  pipelines/measurement_default.trk.pipe
  pipelines/measurement_depth_map.pipe
  pipelines/measurement.gmm_only.pipe
  pipelines/query_augment_image.pipe
  pipelines/query_image_exemplar.cfe.pipe
  pipelines/query_image_exemplar.pipe
  pipelines/query_retrieval_and_iqr.cfe.pipe
  pipelines/query_retrieval_and_iqr.pipe
  pipelines/query_video_exemplar.pipe
  pipelines/sql_init_table.sql
  pipelines/tracker_default.pipe
  pipelines/tracker_default.sfd.pipe
  pipelines/tracker_generic.pipe
  pipelines/tracker_local.pipe
  pipelines/tracker_stabilized_iou.pipe
  pipelines/tracker_svm_models.pipe
  pipelines/train_color_freq_aug.pipe
  pipelines/train_enhance_and_motion_aug.pipe
  pipelines/train_hue_shifting_only_aug.pipe
  pipelines/train_intensity_color_freq_motion_aug.pipe
  pipelines/train_intensity_hue_motion_aug.pipe
  pipelines/train_motion_and_color_freq_aug.pipe
  pipelines/train_motion_aug.pipe
  pipelines/train_split_and_stereo_aug.pipe
  pipelines/train_split_aug.pipe
  pipelines/train_warp_ir_to_eo_aug.pipe
  pipelines/train_yolo_544.viame_csv.conf
  pipelines/train_yolo_704.habcam.conf
  pipelines/train_yolo_704.kw18.conf
  pipelines/train_yolo_704.viame_csv.conf
  pipelines/train_yolo_alt_704.viame_csv.conf
  pipelines/train_yolo_stereo_704.habcam.conf
  pipelines/train_yolo_wtf_704.viame_csv.conf )

if( VIAME_ENABLE_VIVIA )
  set( GUI_PIPELINE_FILES
    pipelines/embedded_single_stream/default_detector.pipe
    pipelines/embedded_single_stream/default_tracker.pipe
    pipelines/embedded_single_stream/filter_debayer.pipe
    pipelines/embedded_single_stream/filter_debayer_and_enhance.pipe
    pipelines/embedded_single_stream/filter_enhance.pipe
    pipelines/embedded_single_stream/generate_empty_frame_lbls_0001fr.pipe
    pipelines/embedded_single_stream/generate_empty_frame_lbls_0010fr.pipe
    pipelines/embedded_single_stream/generate_empty_frame_lbls_0100fr.pipe
    pipelines/embedded_single_stream/generate_empty_frame_lbls_1000fr.pipe
    pipelines/embedded_single_stream/generic_detector.pipe
    pipelines/embedded_single_stream/generic_tracker.pipe
    pipelines/embedded_single_stream/local_deep_detector.pipe
    pipelines/embedded_single_stream/local_deep_detector_with_def_tracker.pipe
    pipelines/embedded_single_stream/local_deep_detector_with_stab_tracker.pipe
    pipelines/embedded_single_stream/local_svm_detector.pipe
    pipelines/embedded_single_stream/local_svm_detector_with_def_tracker.pipe
    pipelines/embedded_single_stream/local_svm_frame_classifier.pipe )

  if( VIAME_ENABLE_YOLO )
    set( GUI_PIPELINE_FILES ${GUI_PIPELINE_FILES}
      pipelines/embedded_single_stream/train_deep_detector_yolo.pipe )
  endif()

  if( VIAME_ENABLE_PYTORCH )
    set( GUI_PIPELINE_FILES ${GUI_PIPELINE_FILES}
      pipelines/embedded_single_stream/train_deep_detector_cfrnn.pipe )
  endif()

  if( VIAME_ENABLE_YOLO AND VIAME_DOWNLOAD_MODELS-MOUSS )
    set( GUI_PIPELINE_FILES ${GUI_PIPELINE_FILES}
      pipelines/embedded_single_stream/mouss_detector.pipe
      pipelines/embedded_single_stream/mouss_tracker.pipe )
  endif()

  if( VIAME_ENABLE_TENSORFLOW AND VIAME_DOWNLOAD_MODELS-ARCTIC-SEAL )
    set( GUI_PIPELINE_FILES ${GUI_PIPELINE_FILES}
      pipelines/embedded_single_stream/arctic_seal_eo_tf_detector.pipe
      pipelines/embedded_single_stream/arctic_seal_ir_tf_detector.pipe )
  endif()

  if( VIAME_ENABLE_YOLO AND VIAME_DOWNLOAD_MODELS-ARCTIC-SEAL )
    set( GUI_PIPELINE_FILES ${GUI_PIPELINE_FILES}
      pipelines/embedded_single_stream/arctic_seal_eo_tiny_yolo_detector.pipe
      pipelines/embedded_single_stream/arctic_seal_eo_tiny_yolo_tracker.pipe
      pipelines/embedded_single_stream/arctic_seal_eo_tiny_yolo_tracker_alt2.pipe
      pipelines/embedded_single_stream/arctic_seal_eo_tiny_yolo_tracker_alt3.pipe
      pipelines/embedded_single_stream/arctic_seal_eo_yolo_detector.pipe
      pipelines/embedded_single_stream/arctic_seal_ir_tiny_yolo_detector.pipe
      pipelines/embedded_single_stream/arctic_seal_ir_yolo_detector.pipe )
  endif()

  if( VIAME_ENABLE_PYTORCH AND VIAME_ENABLE_PYTORCH-PYSOT )
    set( GUI_PIPELINE_FILES ${GUI_PIPELINE_FILES}
      pipelines/embedded_single_stream/track_user_selections_fast.pipe )

    if( VIAME_ENABLE_PYTORCH-MDNET )
      set( GUI_PIPELINE_FILES ${GUI_PIPELINE_FILES}
        pipelines/embedded_single_stream/track_user_selections_fusion.pipe )
    endif()
  endif()

  install( FILES       ${GUI_PIPELINE_FILES}
           DESTINATION configs/pipelines/embedded_single_stream )
endif()

if( VIAME_ENABLE_BURNOUT )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/burnout_det_descriptor.cfe.conf
    pipelines/burnout_det_descriptors.conf
    pipelines/burnout_enhancement.conf
    pipelines/burnout_trk_descriptor.cfe.conf
    pipelines/burnout_trk_descriptors.conf
    pipelines/burnout_pixel_classification.conf
    pipelines/burnout_pixel_detection.conf
    pipelines/burnout_train_classifier.conf
    pipelines/detector_burnout.pipe
    pipelines/filter_burnout.pipe )
endif()

if( VIAME_ENABLE_SMQTK )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/smqtk_compute_hashes.json
    pipelines/smqtk_desc_index.json
    pipelines/smqtk_make_balltree.json
    pipelines/smqtk_nn_index.json
    pipelines/smqtk_postgres_ingest.json
    pipelines/smqtk_query.pipe
    pipelines/smqtk_train_itq.json
    pipelines/train_svm_full_frame_classifier.viame_csv.conf
    pipelines/train_svm_over_generic_detections.viame_csv.conf )
endif()

if( VIAME_ENABLE_OPENCV )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/register_using_homographies.pipe
    pipelines/register_multimodal_unsync_ocv.pipe )
endif()

if( VIAME_ENABLE_PYTORCH )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/train_mmdet_cascade.habcam.conf
    pipelines/train_mmdet_cascade.viame_csv.conf)
endif()

if( VIAME_ENABLE_PYTORCH-NETHARN )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/train_netharn_cascade.viame_csv.conf
    pipelines/train_netharn_cascade.habcam.conf
    pipelines/train_netharn_cascade_nf.viame_csv.conf
    pipelines/train_netharn_cascade_wtf.viame_csv.conf
    pipelines/train_netharn_resnet.viame_csv.conf
    pipelines/train_netharn_resnet_nf.viame_csv.conf )
endif()

if( VIAME_ENABLE_PYTORCH AND VIAME_ENABLE_PYTORCH-PYSOT )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/common_short_term_tracker.pipe
    pipelines/tracker_short_term.pipe )
endif()

if( VIAME_ENABLE_ITK )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/register_multimodal_sync_itk.pipe
    pipelines/register_multimodal_unsync_itk.pipe )
endif()

if( VIAME_ENABLE_TENSORFLOW AND VIAME_DOWNLOAD_MODELS-ARCTIC-SEAL )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/common_arctic_seal_eo_tf_detector.pipe
    pipelines/common_arctic_seal_ir_tf_detector.pipe
    pipelines/detector_arctic_seal_eo_tf.pipe
    pipelines/detector_arctic_seal_ir_tf.pipe )
endif()

if( VIAME_ENABLE_YOLO AND VIAME_DOWNLOAD_MODELS-ARCTIC-SEAL )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/common_arctic_seal_eo_yolo_detector.pipe
    pipelines/common_arctic_seal_eo_tiny_yolo_detector.pipe
    pipelines/common_arctic_seal_ir_yolo_detector.pipe
    pipelines/common_arctic_seal_ir_tiny_yolo_detector.pipe
    pipelines/detector_arctic_seal_fusion_yolo.pipe
    pipelines/detector_arctic_seal_eo_yolo.pipe
    pipelines/detector_arctic_seal_ir_yolo.pipe )
endif()

if( VIAME_ENABLE_YOLO AND VIAME_DOWNLOAD_MODELS-MOUSS )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/common_mouss_detector.pipe
    pipelines/common_mouss_detector_with_filter.pipe
    pipelines/index_mouss.pipe
    pipelines/index_mouss.no_desc.pipe
    pipelines/index_mouss.trk.no_desc.pipe
    pipelines/index_mouss.trk.pipe
    pipelines/tracker_mouss.pipe )
endif()

if( VIAME_ENABLE_MATLAB )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/detector_matlab_camtrawl.pipe )
endif()

if( VIAME_ENABLE_CAFFE )
  set( CORE_PIPELINE_FILES ${CORE_PIPELINE_FILES}
    pipelines/tracker_default.sfd.cfe.pipe
    pipelines/index_default.sfd.cfe.pipe )
endif()

if( VIAME_ENABLE_SEAK_TK OR VIAME_DOWNLOAD_MODELS-ARCTIC-SEAL )
  set( DUAL_EMBEDDED_FILES
    pipelines/embedded_dual_stream/local_trained_eo_detector.pipe
    pipelines/embedded_dual_stream/local_trained_ir_detector.pipe )

  if( VIAME_ENABLE_PYTORCH-NETHARN )
    set( DUAL_EMBEDDED_FILES ${DUAL_EMBEDDED_FILES}
      pipelines/embedded_dual_stream/train_cfrnn_eo.pipe
      pipelines/embedded_dual_stream/train_cfrnn_ir.pipe )
  endif()

  if( VIAME_ENABLE_YOLO )
    set( DUAL_EMBEDDED_FILES ${DUAL_EMBEDDED_FILES}
      pipelines/embedded_dual_stream/train_yolo_eo.pipe
      pipelines/embedded_dual_stream/train_yolo_ir.pipe )
  endif()

  if( VIAME_ENABLE_PYTORCH-PYSOT )
    set( DUAL_EMBEDDED_FILES ${DUAL_EMBEDDED_FILES}
      pipelines/embedded_dual_stream/track_user_selections_fast.pipe )
  endif()

  if( VIAME_DOWNLOAD_MODELS-ARCTIC-SEAL )
    set( DUAL_EMBEDDED_FILES ${DUAL_EMBEDDED_FILES}
      pipelines/embedded_dual_stream/arctic_seal_tf_eo_only.pipe
      pipelines/embedded_dual_stream/arctic_seal_tf_ir_only.pipe
      pipelines/embedded_dual_stream/arctic_seal_tf_ir_to_eo_frame_trigger.pipe
      pipelines/embedded_dual_stream/arctic_seal_tiny_yolo_eo_only.pipe
      pipelines/embedded_dual_stream/arctic_seal_tiny_yolo_eo_tracker.pipe
      pipelines/embedded_dual_stream/arctic_seal_tiny_yolo_eo_tracker_alt.pipe
      pipelines/embedded_dual_stream/arctic_seal_yolo_eo_ir_early_fusion.pipe
      pipelines/embedded_dual_stream/arctic_seal_yolo_eo_only.pipe
      pipelines/embedded_dual_stream/arctic_seal_yolo_ir_only.pipe
      pipelines/embedded_dual_stream/arctic_seal_yolo_ir_to_eo_frame_trigger.pipe
      pipelines/embedded_dual_stream/arctic_seal_yolo_ir_to_eo_region_trigger.pipe
      pipelines/embedded_dual_stream/arctic_seal_yolo_ir_to_tiny_eo_region_tigger.pipe )
  endif()

  install( FILES       ${DUAL_EMBEDDED_FILES}
           DESTINATION configs/pipelines/embedded_dual_stream )
endif()

install( FILES       ${CORE_PIPELINE_FILES}
         DESTINATION configs/pipelines )
install( DIRECTORY   pipelines/templates
         DESTINATION configs/pipelines )

if( VIAME_DOWNLOAD_MODELS )
  install( DIRECTORY   pipelines/models
           DESTINATION configs/pipelines )

  if( VIAME_DOWNLOAD_MODELS-ARCTIC-SEAL )
    install( DIRECTORY   pipelines/transformations
             DESTINATION configs/pipelines )
  endif()
endif()
