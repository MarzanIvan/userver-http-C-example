#include "handlers.hxx"

#include "message.hxx"

using namespace userver;

namespace samples::hello {

    std::string
    HelloHandler::HandleRequest(server::http::HttpRequest& request, server::request::RequestContext& /*request_context*/)
    const {
        request.GetHttpResponse().SetContentType(http::content_type::kTextPlain);
        return samples::hello::SayHelloTo(request.GetArg("name"));
    }

}  // namespace samples::hello