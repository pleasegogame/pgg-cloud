package com.pgg.gateway.filter;

import cn.hutool.core.util.StrUtil;
import com.pgg.platform.constant.AuthConstant;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Consumer;

@Slf4j
@Component
public class TenantGlobalFilter implements GlobalFilter, Ordered {

    /**
     * 是否开启租户模式
     */
    @Value("${tenant.enable}")
    private Boolean enable;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {

        String tenantId = exchange.getRequest().getHeaders().getFirst(AuthConstant.TENANT_ID);

        String token = exchange.getRequest().getHeaders().getFirst(AuthConstant.JWT_TOKEN_HEADER);

        if (StrUtil.isEmpty(tenantId) && StrUtil.isEmpty(token)) {
            return chain.filter(exchange);
        }

        Map<String, String> addHeaders = new HashMap<>();

        // 如果系统配置已开启租户模式，设置tenantId
        if (enable && StrUtil.isEmpty(tenantId)) {
            addHeaders.put(AuthConstant.TENANT_ID, tenantId);
        }

        // HttpHeader
        Consumer<HttpHeaders> httpHeaders = httpHeader -> {
            addHeaders.forEach((k, v) -> {
                httpHeader.set(k, v);
            });
        };

        ServerHttpRequest request = exchange.getRequest().mutate().headers(httpHeaders).build();
        exchange = exchange.mutate().request(request).build();
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return 0;
    }

    // 对应前端请求 request interceptor
//    request.interceptors.request.use(config => {
//      const token = storage.get(ACCESS_TOKEN)
//            // 如果 token 存在
//            // 让每个请求携带自定义 token 请根据实际情况自行修改
//            if (token) {
//                config.headers['Authorization'] = token
//            }
//            config.headers['TenantId'] = process.env.VUE_APP_TENANT_ID
//            return config
//        }, errorHandler)
}
