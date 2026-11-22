import React from 'react';
import { AlertCircle, RefreshCw, Home } from 'lucide-react';
import { Link } from 'react-router-dom';

export class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false, error: null };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true, error };
  }

  componentDidCatch(error, errorInfo) {
    console.error('ErrorBoundary caught an unhandled error:', error, errorInfo);
  }

  handleReset = () => {
    this.setState({ hasError: false, error: null });
  };

  render() {
    const { fallbackTitle = 'Something went wrong', fallbackLink = '/' } = this.props;

    if (this.state.hasError) {
      return (
        <div className="min-h-[50vh] flex items-center justify-center p-6">
          <div className="max-w-md w-full bg-white rounded-2xl border border-rose-200 p-8 shadow-sm text-center space-y-4">
            <div className="w-14 h-14 bg-rose-50 text-rose-600 rounded-full flex items-center justify-center mx-auto">
              <AlertCircle className="w-7 h-7" />
            </div>
            <div>
              <h2 className="text-xl font-bold font-heading text-navy-deep">
                {fallbackTitle}
              </h2>
              <p className="text-sm text-slate-500 mt-2">
                An unexpected error occurred while displaying this page. Your data is safe.
              </p>
              {this.state.error?.message && (
                <div className="mt-3 p-3 bg-slate-50 rounded-lg text-xs font-mono text-slate-700 text-left overflow-x-auto border border-slate-200">
                  {this.state.error.message}
                </div>
              )}
            </div>
            <div className="flex items-center justify-center gap-3 pt-2">
              <button
                onClick={this.handleReset}
                className="inline-flex items-center gap-2 px-4 py-2 text-sm font-semibold text-royal bg-royal/10 hover:bg-royal/20 rounded-xl transition-colors"
              >
                <RefreshCw className="w-4 h-4" />
                <span>Try Again</span>
              </button>
              <Link
                to={fallbackLink}
                onClick={this.handleReset}
                className="inline-flex items-center gap-2 px-4 py-2 text-sm font-semibold text-white bg-royal hover:bg-navy-deep rounded-xl transition-colors"
              >
                <Home className="w-4 h-4" />
                <span>{fallbackLink === '/' ? 'Return Home' : 'Back to Console'}</span>
              </Link>
            </div>
          </div>
        </div>
      );
    }

    return this.props.children;
  }
}

export default ErrorBoundary;
