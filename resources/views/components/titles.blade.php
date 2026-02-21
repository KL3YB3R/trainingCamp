@props(['title', 'subtitle'])

<div class="section-heading" style="margin-bottom:12px;">
    <h2>{{$title}}</h2>
    @if($subtitle)
        <p class="lead">{{ $subtitle }}</p>
    @endif
    <span class="decor" aria-hidden="true"></span>
</div>