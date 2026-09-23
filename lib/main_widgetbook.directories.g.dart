// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:v2report_app/widgetbook/features/auth/login_screen.usecase.dart'
    as _v2report_app_widgetbook_features_auth_login_screen_usecase;
import 'package:v2report_app/widgetbook/theme/theme_showcase.usecase.dart'
    as _v2report_app_widgetbook_theme_theme_showcase_usecase;
import 'package:v2report_app/widgetbook/widgets/buttons/app_button.usecase.dart'
    as _v2report_app_widgetbook_widgets_buttons_app_button_usecase;
import 'package:v2report_app/widgetbook/widgets/cards/app_card.usecase.dart'
    as _v2report_app_widgetbook_widgets_cards_app_card_usecase;
import 'package:v2report_app/widgetbook/widgets/cards/panel_card.usecase.dart'
    as _v2report_app_widgetbook_widgets_cards_panel_card_usecase;
import 'package:v2report_app/widgetbook/widgets/cards/source_group_card.usecase.dart'
    as _v2report_app_widgetbook_widgets_cards_source_group_card_usecase;
import 'package:v2report_app/widgetbook/widgets/cards/stat_card.usecase.dart'
    as _v2report_app_widgetbook_widgets_cards_stat_card_usecase;
import 'package:v2report_app/widgetbook/widgets/charts/app_bar_chart.usecase.dart'
    as _v2report_app_widgetbook_widgets_charts_app_bar_chart_usecase;
import 'package:v2report_app/widgetbook/widgets/charts/app_line_chart.usecase.dart'
    as _v2report_app_widgetbook_widgets_charts_app_line_chart_usecase;
import 'package:v2report_app/widgetbook/widgets/charts/app_pie_chart.usecase.dart'
    as _v2report_app_widgetbook_widgets_charts_app_pie_chart_usecase;
import 'package:v2report_app/widgetbook/widgets/chips/app_chip.usecase.dart'
    as _v2report_app_widgetbook_widgets_chips_app_chip_usecase;
import 'package:v2report_app/widgetbook/widgets/inputs/app_text_field.usecase.dart'
    as _v2report_app_widgetbook_widgets_inputs_app_text_field_usecase;
import 'package:v2report_app/widgetbook/widgets/list_items/alert_list_item.usecase.dart'
    as _v2report_app_widgetbook_widgets_list_items_alert_list_item_usecase;
import 'package:v2report_app/widgetbook/widgets/list_items/log_list_item.usecase.dart'
    as _v2report_app_widgetbook_widgets_list_items_log_list_item_usecase;
import 'package:v2report_app/widgetbook/widgets/list_items/stacked_card_group.usecase.dart'
    as _v2report_app_widgetbook_widgets_list_items_stacked_card_group_usecase;
import 'package:v2report_app/widgetbook/widgets/scaffolds/app_form_scaffold.usecase.dart'
    as _v2report_app_widgetbook_widgets_scaffolds_app_form_scaffold_usecase;
import 'package:v2report_app/widgetbook/widgets/scaffolds/app_list_scaffold.usecase.dart'
    as _v2report_app_widgetbook_widgets_scaffolds_app_list_scaffold_usecase;
import 'package:v2report_app/widgetbook/widgets/scaffolds/app_scaffold.usecase.dart'
    as _v2report_app_widgetbook_widgets_scaffolds_app_scaffold_usecase;
import 'package:v2report_app/widgetbook/widgets/search_dialog/search_dialog.usecase.dart'
    as _v2report_app_widgetbook_widgets_search_dialog_search_dialog_usecase;
import 'package:v2report_app/widgetbook/widgets/states/empty_state_view.usecase.dart'
    as _v2report_app_widgetbook_widgets_states_empty_state_view_usecase;
import 'package:v2report_app/widgetbook/widgets/states/error_state_view.usecase.dart'
    as _v2report_app_widgetbook_widgets_states_error_state_view_usecase;
import 'package:v2report_app/widgetbook/widgets/states/loading_indicator.usecase.dart'
    as _v2report_app_widgetbook_widgets_states_loading_indicator_usecase;
import 'package:v2report_app/widgetbook/widgets/states/rich_empty_state.usecase.dart'
    as _v2report_app_widgetbook_widgets_states_rich_empty_state_usecase;
import 'package:v2report_app/widgetbook/widgets/tables/app_data_table.usecase.dart'
    as _v2report_app_widgetbook_widgets_tables_app_data_table_usecase;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'features',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'auth',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'presentation',
            children: [
              _widgetbook.WidgetbookFolder(
                name: 'screens',
                children: [
                  _widgetbook.WidgetbookComponent(
                    name: 'LoginScreen',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Default',
                        builder:
                            _v2report_app_widgetbook_features_auth_login_screen_usecase
                                .buildLoginScreenUseCase,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'shared',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'widgets',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'buttons',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppButton',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_buttons_app_button_usecase
                            .buildAppButtonDefaultUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Disabled',
                    builder:
                        _v2report_app_widgetbook_widgets_buttons_app_button_usecase
                            .buildAppButtonDisabledUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Loading',
                    builder:
                        _v2report_app_widgetbook_widgets_buttons_app_button_usecase
                            .buildAppButtonLoadingUseCase,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'cards',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppCard',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_cards_app_card_usecase
                            .buildAppCardDefaultUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Với nhiều dòng',
                    builder:
                        _v2report_app_widgetbook_widgets_cards_app_card_usecase
                            .buildAppCardMultilineUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'PanelCard',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Chỉ title, không action',
                    builder:
                        _v2report_app_widgetbook_widgets_cards_panel_card_usecase
                            .buildPanelCardMinimalUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Với bảng',
                    builder:
                        _v2report_app_widgetbook_widgets_cards_panel_card_usecase
                            .buildPanelCardWithTableUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'SourceGroupCard',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: '2 log (không có nút mở rộng)',
                    builder:
                        _v2report_app_widgetbook_widgets_cards_source_group_card_usecase
                            .buildSourceGroupCardShortUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default (5 log, thu gọn)',
                    builder:
                        _v2report_app_widgetbook_widgets_cards_source_group_card_usecase
                            .buildSourceGroupCardDefaultUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Tất cả loại nguồn (icon theo vai trò)',
                    builder:
                        _v2report_app_widgetbook_widgets_cards_source_group_card_usecase
                            .buildSourceGroupCardAllSourceTypesUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Với subtitle',
                    builder:
                        _v2report_app_widgetbook_widgets_cards_source_group_card_usecase
                            .buildSourceGroupCardWithSubtitleUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'StatCard',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Giảm',
                    builder:
                        _v2report_app_widgetbook_widgets_cards_stat_card_usecase
                            .buildStatCardDownUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Không có xu hướng',
                    builder:
                        _v2report_app_widgetbook_widgets_cards_stat_card_usecase
                            .buildStatCardNoneUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Tăng',
                    builder:
                        _v2report_app_widgetbook_widgets_cards_stat_card_usecase
                            .buildStatCardUpUseCase,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'charts',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppBarChart',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_charts_app_bar_chart_usecase
                            .buildAppBarChartUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Trong PanelCard',
                    builder:
                        _v2report_app_widgetbook_widgets_charts_app_bar_chart_usecase
                            .buildAppBarChartInPanelUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'AppLineChart',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_charts_app_line_chart_usecase
                            .buildAppLineChartUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Trong PanelCard',
                    builder:
                        _v2report_app_widgetbook_widgets_charts_app_line_chart_usecase
                            .buildAppLineChartInPanelUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'AppPieChart',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_charts_app_pie_chart_usecase
                            .buildAppPieChartUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Trong PanelCard',
                    builder:
                        _v2report_app_widgetbook_widgets_charts_app_pie_chart_usecase
                            .buildAppPieChartInPanelUseCase,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'chips',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppChip',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_chips_app_chip_usecase
                            .buildAppChipUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Nhóm nhiều chip',
                    builder:
                        _v2report_app_widgetbook_widgets_chips_app_chip_usecase
                            .buildAppChipGroupUseCase,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'inputs',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppTextField',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_inputs_app_text_field_usecase
                            .buildAppTextFieldDefaultUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Disabled',
                    builder:
                        _v2report_app_widgetbook_widgets_inputs_app_text_field_usecase
                            .buildAppTextFieldDisabledUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Error',
                    builder:
                        _v2report_app_widgetbook_widgets_inputs_app_text_field_usecase
                            .buildAppTextFieldErrorUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Password (toggle con mắt)',
                    builder:
                        _v2report_app_widgetbook_widgets_inputs_app_text_field_usecase
                            .buildAppTextFieldPasswordUseCase,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'list_items',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AlertListItem',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'High',
                    builder:
                        _v2report_app_widgetbook_widgets_list_items_alert_list_item_usecase
                            .buildAlertListItemHighUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Medium (có subtitle)',
                    builder:
                        _v2report_app_widgetbook_widgets_list_items_alert_list_item_usecase
                            .buildAlertListItemMediumUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'None',
                    builder:
                        _v2report_app_widgetbook_widgets_list_items_alert_list_item_usecase
                            .buildAlertListItemNoneUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'LogListItem',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Có subtitle',
                    builder:
                        _v2report_app_widgetbook_widgets_list_items_log_list_item_usecase
                            .buildLogListItemWithSubtitleUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_list_items_log_list_item_usecase
                            .buildLogListItemUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'StackedCardGroup',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default (bấm để mở/thu gọn)',
                    builder:
                        _v2report_app_widgetbook_widgets_list_items_stacked_card_group_usecase
                            .buildStackedCardGroupUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Ít hơn collapsedVisibleCount',
                    builder:
                        _v2report_app_widgetbook_widgets_list_items_stacked_card_group_usecase
                            .buildStackedCardGroupFewUseCase,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'scaffolds',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppFormScaffold',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_scaffolds_app_form_scaffold_usecase
                            .buildAppFormScaffoldUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Với lỗi',
                    builder:
                        _v2report_app_widgetbook_widgets_scaffolds_app_form_scaffold_usecase
                            .buildAppFormScaffoldErrorUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Đang submit',
                    builder:
                        _v2report_app_widgetbook_widgets_scaffolds_app_form_scaffold_usecase
                            .buildAppFormScaffoldSubmittingUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'AppListScaffold',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Data',
                    builder:
                        _v2report_app_widgetbook_widgets_scaffolds_app_list_scaffold_usecase
                            .buildAppListScaffoldDataUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Empty',
                    builder:
                        _v2report_app_widgetbook_widgets_scaffolds_app_list_scaffold_usecase
                            .buildAppListScaffoldEmptyUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Error',
                    builder:
                        _v2report_app_widgetbook_widgets_scaffolds_app_list_scaffold_usecase
                            .buildAppListScaffoldErrorUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Loading',
                    builder:
                        _v2report_app_widgetbook_widgets_scaffolds_app_list_scaffold_usecase
                            .buildAppListScaffoldLoadingUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'AppScaffold',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_scaffolds_app_scaffold_usecase
                            .buildAppScaffoldUseCase,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'search_dialog',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'SearchDialog',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Danh sách rỗng',
                    builder:
                        _v2report_app_widgetbook_widgets_search_dialog_search_dialog_usecase
                            .buildSearchDialogEmptyUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_search_dialog_search_dialog_usecase
                            .buildSearchDialogUseCase,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'states',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'EmptyStateView',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_states_empty_state_view_usecase
                            .buildEmptyStateViewUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'ErrorStateView',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Không có nút Thử lại',
                    builder:
                        _v2report_app_widgetbook_widgets_states_error_state_view_usecase
                            .buildErrorStateViewNoRetryUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Với nút Thử lại',
                    builder:
                        _v2report_app_widgetbook_widgets_states_error_state_view_usecase
                            .buildErrorStateViewWithRetryUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'LoadingIndicator',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_states_loading_indicator_usecase
                            .buildLoadingIndicatorUseCase,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'RichEmptyState',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_states_rich_empty_state_usecase
                            .buildRichEmptyStateUseCase,
                  ),
                ],
              ),
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'tables',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'AppDataTable',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _v2report_app_widgetbook_widgets_tables_app_data_table_usecase
                            .buildAppDataTableDefaultUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Nhiều cột',
                    builder:
                        _v2report_app_widgetbook_widgets_tables_app_data_table_usecase
                            .buildAppDataTableMultiColumnUseCase,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'widgetbook',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'theme',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'ThemeShowcase',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder: _v2report_app_widgetbook_theme_theme_showcase_usecase
                    .buildThemeShowcaseUseCase,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
