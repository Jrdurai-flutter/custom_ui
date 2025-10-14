import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs2015.dart';

class EnhancedCodePanel extends StatefulWidget {
  final String code;
  final bool isOpen;
  final VoidCallback onClose;

  const EnhancedCodePanel({
    super.key,
    required this.code,
    required this.isOpen,
    required this.onClose,
  });

  @override
  State<EnhancedCodePanel> createState() => _EnhancedCodePanelState();
}

class _EnhancedCodePanelState extends State<EnhancedCodePanel> {
  bool _isDarkTheme = true;
  bool _showLineNumbers = true;
  bool _copySuccess = false;

  void _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.code));
    setState(() {
      _copySuccess = true;
    });
    
    // Reset the success indicator after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _copySuccess = false;
        });
      }
    });
  }

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  void _toggleLineNumbers() {
    setState(() {
      _showLineNumbers = !_showLineNumbers;
    });
  }

  List<String> _getCodeLines() {
    return widget.code.split('\n');
  }

  Widget _buildLineNumbers() {
    final lines = _getCodeLines();
    return Container(
      padding: const EdgeInsets.only(right: 8, top: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: lines.asMap().entries.map((entry) {
          final lineNumber = entry.key + 1;
          return Container(
            height: 20, // Match the line height of the code
            alignment: Alignment.centerRight,
            child: Text(
              lineNumber.toString(),
              style: TextStyle(
                color: _isDarkTheme ? Colors.grey[600] : Colors.grey[400],
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      top: 0,
      bottom: 0,
      right: 0,
      width: widget.isOpen ? 500 : 0,
      child: AbsorbPointer(
        absorbing: !widget.isOpen,
        child: Container(
          decoration: BoxDecoration(
            color: _isDarkTheme ? const Color(0xFF1E1E1E) : Colors.white,
            boxShadow: widget.isOpen
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(-2, 0),
                    )
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with controls
              Container(
                color: _isDarkTheme ? const Color(0xFF2D2D30) : Colors.grey[100],
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.code,
                      color: _isDarkTheme ? Colors.white70 : Colors.grey[700],
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Code Snippet",
                        style: TextStyle(
                          color: _isDarkTheme ? Colors.white70 : Colors.grey[700],
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // Theme toggle
                    IconButton(
                      icon: Icon(
                        _isDarkTheme ? Icons.light_mode : Icons.dark_mode,
                        color: _isDarkTheme ? Colors.white70 : Colors.grey[700],
                        size: 18,
                      ),
                      onPressed: _toggleTheme,
                      tooltip: _isDarkTheme ? 'Light theme' : 'Dark theme',
                    ),
                    // Line numbers toggle
                    IconButton(
                      icon: Icon(
                        _showLineNumbers ? Icons.format_list_numbered : Icons.format_list_numbered_rtl,
                        color: _isDarkTheme ? Colors.white70 : Colors.grey[700],
                        size: 18,
                      ),
                      onPressed: _toggleLineNumbers,
                      tooltip: _showLineNumbers ? 'Hide line numbers' : 'Show line numbers',
                    ),
                    // Copy button
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: IconButton(
                        icon: Icon(
                          _copySuccess ? Icons.check : Icons.copy,
                          color: _copySuccess 
                              ? Colors.green 
                              : (_isDarkTheme ? Colors.white70 : Colors.grey[700]),
                          size: 18,
                        ),
                        onPressed: _copyToClipboard,
                        tooltip: _copySuccess ? 'Copied!' : 'Copy code',
                      ),
                    ),
                    // Close button
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: _isDarkTheme ? Colors.white70 : Colors.grey[700],
                        size: 18,
                      ),
                      onPressed: widget.onClose,
                      tooltip: 'Close',
                    ),
                  ],
                ),
              ),
              
              // Divider
              Divider(
                height: 1,
                color: _isDarkTheme ? Colors.white24 : Colors.grey[300],
              ),
              
              // Code content with syntax highlighting
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Line numbers
                    if (_showLineNumbers)
                      Container(
                        color: _isDarkTheme ? const Color(0xFF252526) : Colors.grey[50],
                        child: _buildLineNumbers(),
                      ),
                    
                    // Vertical divider between line numbers and code
                    if (_showLineNumbers)
                      Container(
                        width: 1,
                        color: _isDarkTheme ? Colors.white24 : Colors.grey[300],
                      ),
                    
                    // Code content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: HighlightView(
                            widget.code,
                            language: 'dart',
                            theme: _isDarkTheme ? vs2015Theme : githubTheme,
                            padding: EdgeInsets.zero,
                            textStyle: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Footer with copy success message
              if (_copySuccess)
                Container(
                  color: Colors.green.withOpacity(0.1),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Code copied to clipboard!',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
